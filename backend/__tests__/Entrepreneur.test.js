const supertest = require('supertest');

const app = require('../src/app');
const { entrepreneurs } = require('../src/repositories/Entrepreneur');

jest.mock('../src/repositories/Entrepreneur', () =>
  jest.requireActual('../src/repositories/Entrepreneur.mock')
);

describe('Entrepreneur', () => {
  beforeEach(() => {
    entrepreneurs.splice(0, entrepreneurs.length);
  });

  it('should create a entrepreneur', async () => {
    const server = await app.createServer();
    const api = supertest(server);

    expect(entrepreneurs.length).toBe(0);

    const response = await api.post('/entrepreneurs').send({
      email: 'raphael@gmail.com',
      password: '123',
      confirmPassword: '123',
    });

    expect(response.status).toBe(201);
    expect(response.body).toEqual({});

    expect(entrepreneurs.length).toBe(1);
    expect(entrepreneurs[0].email).toEqual('raphael@gmail.com');
  });

  it('should get error creating entrepreneur with mismatch confirm password', async () => {
    const server = await app.createServer();
    const api = supertest(server);

    expect(entrepreneurs.length).toBe(0);

    const response = await api.post('/entrepreneurs').send({
      email: 'raphael@gmail.com',
      password: '123',
      confirmPassword: '1234',
    });

    expect(response.status).toBe(400);
    expect(response.body.error).toEqual('password_mismatch');
  });

  it('should get error creating entrepreneur with empty payload', async () => {
    const server = await app.createServer();
    const api = supertest(server);

    expect(entrepreneurs.length).toBe(0);

    const response = await api.post('/entrepreneurs').send({});

    expect(response.status).toBe(400);
    expect(response.body.error).toEqual('invalid_payload');
  });
});
