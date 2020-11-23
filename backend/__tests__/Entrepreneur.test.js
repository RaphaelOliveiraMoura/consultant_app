const supertest = require('supertest');

const app = require('../src/app');
const Entrepreneur = require('../src/models/Entrepreneur');

jest.mock('../src/models/Entrepreneur', () =>
  jest.requireActual('../src/models/Entrepreneur.mock')
);

describe('Entrepreneur', () => {
  beforeEach(() => {
    Entrepreneur.entrepreneurs.splice(0, Entrepreneur.entrepreneurs);
  });

  it('should create a entrepreneur', async () => {
    const server = supertest(app);

    expect(Entrepreneur.entrepreneurs.length).toBe(0);

    const response = await server.post('/entrepreneurs').send({
      email: 'raphael@gmail.com',
      password: '123',
      confirmPassword: '123',
    });

    expect(response.status).toBe(201);
    expect(response.body).toEqual({});

    expect(Entrepreneur.entrepreneurs.length).toBe(1);
    expect(Entrepreneur.entrepreneurs[0].email).toEqual('raphael@gmail.com');
  });
});
