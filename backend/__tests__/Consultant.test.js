const supertest = require('supertest');

const app = require('../src/app');
const { consultants } = require('../src/repositories/Consultant');

jest.mock('../src/repositories/Consultant', () =>
  jest.requireActual('../src/repositories/Consultant.mock')
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

  it('should get error creating a consultant with invalid confirm password match', async () => {
    const server = supertest(app);

    expect(consultants.length).toBe(0);

    const response = await server.post('/consultants').send({
      specialization: 'tecnology',
      name: 'Raphael',
      email: 'raphael@gmail.com',
      password: '123',
      confirmPassword: '1234',
    });

    expect(response.status).toBe(400);
    expect(response.body.error).toEqual('password_mismatch');
  });

  it('should get error creating a consultant with empty payload', async () => {
    const server = supertest(app);

    expect(consultants.length).toBe(0);

    const response = await server.post('/consultants').send({});

    expect(response.status).toBe(400);
    expect(response.body.error).toEqual('invalid_payload');
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
