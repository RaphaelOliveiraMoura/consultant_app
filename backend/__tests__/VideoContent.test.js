const supertest = require('supertest');
const { v4: uuid } = require('uuid');

const app = require('../src/app');
const { videoContentList } = require('../src/models/VideoContent');
const { consultants } = require('../src/models/Consultant');

jest.mock('../src/models/VideoContent', () =>
  jest.requireActual('../src/models/VideoContent.mock')
);

jest.mock('../src/models/Consultant', () =>
  jest.requireActual('../src/models/Consultant.mock')
);

describe('Video Content', () => {
  beforeEach(() => {
    videoContentList.splice(0, videoContentList.length);
    consultants.splice(0, consultants.length);
  });

  it('should return a list of content videos', async () => {
    const consultant = {
      id: uuid(),
      name: 'raphael',
      email: 'raphael@gmail.com',
      password: '123',
    };

    consultants.push(consultant);
    videoContentList.push({
      consultantId: consultant.id,
      youtubeUrl: 'https://youtube.com',
      title: 'Title',
      description: 'Description',
    });

    const server = supertest(app);

    const response = await server.get('/explorer');

    expect(response.status).toBe(200);
    expect(Array.isArray(response.body)).toBeTruthy();

    expect(response.body[0].consultant.email).toBe('raphael@gmail.com');
    expect(response.body[0].youtubeUrl).toBe('https://youtube.com');
  });

  it('should register a new video content', async () => {
    const consultant = {
      id: uuid(),
      name: 'raphael',
      email: 'raphael@gmail.com',
      password: '123',
    };

    consultants.push(consultant);

    const server = supertest(app);

    const response = await server
      .post('/videos')
      .set('Authorization', consultant.id)
      .send({
        youtubeUrl: 'https://youtube.com',
        title: 'Title',
        description: 'Description',
      });

    expect(response.status).toBe(201);
    expect(response.body).toEqual({});

    expect(videoContentList.length).toEqual(1);
    expect(videoContentList[0].consultantId).toEqual(consultant.id);
    expect(videoContentList[0].youtubeUrl).toEqual('https://youtube.com');
  });
});
