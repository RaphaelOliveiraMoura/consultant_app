const supertest = require('supertest');

const app = require('../src/app');

jest.mock('../src/models/VideoContent', () =>
  jest.requireActual('../src/models/VideoContent.mock')
);

describe('Explorer', () => {
  it('should return a list of content videos', async () => {
    const server = supertest(app);

    const response = await server.get('/explorer');

    expect(response.status).toBe(200);
    expect(Array.isArray(response.body)).toBeTruthy();
  });
});
