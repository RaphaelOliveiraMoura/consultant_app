const supertest = require('supertest');

const app = require('../src/app');
const { consultants } = require('../src/models/Consultant');

jest.mock('../src/models/Consultant', () =>
  jest.requireActual('../src/models/Consultant.mock')
);

describe('Consultant', () => {
  beforeEach(() => {
    consultants.splice(0, consultants.length);
  });

  it('should create a new consultant', async () => {
    const server = supertest(app);

    expect(consultants.length).toBe(0);

    const response = await server.post('/consultants').send({
      specialization: 'tecnology',
      name: 'Raphael',
      email: 'raphael@gmail.com',
      password: '123',
      confirmPassword: '123',
    });

    expect(response.status).toBe(201);
    expect(response.body).toEqual({});

    expect(consultants.length).toBe(1);
    expect(consultants[0].name).toEqual('Raphael');
  });

  it('should list all consultants', async () => {
    consultants.push({
      specialization: 'tecnology',
      name: 'Teste',
      email: 'teste@gmail.com',
      password: '123',
    });

    const server = supertest(app);

    const response = await server.get('/consultants');

    expect(response.status).toBe(200);
    expect(Array.isArray(response.body)).toBeTruthy();
    expect(response.body[0].email).toBe('teste@gmail.com');
    expect(response.body[0].specialization).toBe('tecnology');
  });
});
