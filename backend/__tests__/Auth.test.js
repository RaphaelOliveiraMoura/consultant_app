const supertest = require('supertest');
const { v4: uuid } = require('uuid');

const app = require('../src/app');
const { consultants } = require('../src/repositories/Consultant');
const { entrepreneurs } = require('../src/repositories/Entrepreneur');

jest.mock('../src/repositories/Consultant', () =>
  jest.requireActual('../src/repositories/Consultant.mock')
);

jest.mock('../src/repositories/Entrepreneur', () =>
  jest.requireActual('../src/repositories/Entrepreneur.mock')
);

describe('Consultant', () => {
  beforeEach(() => {
    consultants.splice(0, consultants.length);
    entrepreneurs.splice(0, entrepreneurs.length);
  });

  it('should auth a consultant', async () => {
    const consultant = {
      id: uuid(),
      email: 'teste@mail.com',
      password: '123',
      name: 'Raphael',
      specialization: 'human_resources',
    };

    consultants.push(consultant);

    const server = supertest(app);

    const response = await server.post('/consultants/auth').send({
      email: 'teste@mail.com',
      password: '123',
    });

    expect(response.status).toBe(200);
    expect(response.body.name).toEqual('Raphael');
    expect(response.body.email).toEqual('teste@mail.com');
    expect(response.body.specialization).toEqual('human_resources');
    expect(response.body.id).toEqual(consultant.id);
  });

  it('should return 401 for unauthorized consultant, invalid password', async () => {
    const consultant = {
      id: uuid(),
      email: 'teste@mail.com',
      password: '123',
      name: 'Raphael',
      specialization: 'human_resources',
    };

    consultants.push(consultant);

    const server = supertest(app);

    const response = await server.post('/consultants/auth').send({
      email: 'teste@mail.com',
      password: '1234',
    });

    expect(response.status).toBe(401);
  });

  it('should return 401 for unauthorized consultant, invalid email', async () => {
    const consultant = {
      id: uuid(),
      email: 'teste@mail.com',
      password: '123',
      name: 'Raphael',
      specialization: 'human_resources',
    };

    consultants.push(consultant);

    const server = supertest(app);

    const response = await server.post('/consultants/auth').send({
      email: 'invalid@mail.com',
      password: '1234',
    });

    expect(response.status).toBe(401);
  });

  it('should auth a entrepreneur', async () => {
    const entrepreneur = {
      id: uuid(),
      email: 'entrepreneur@mail.com',
      password: '12345',
      name: 'Teste',
    };

    entrepreneurs.push(entrepreneur);

    const server = supertest(app);

    const response = await server.post('/entrepreneurs/auth').send({
      email: 'entrepreneur@mail.com',
      password: '12345',
    });

    expect(response.status).toBe(200);
    expect(response.body.name).toEqual('Teste');
    expect(response.body.email).toEqual('entrepreneur@mail.com');
    expect(response.body.id).toEqual(entrepreneur.id);
  });

  it('should return 401 for unauthorized entrepreneur, invalid password', async () => {
    const entrepreneur = {
      id: uuid(),
      email: 'entrepreneur@mail.com',
      password: '12345',
      name: 'Teste',
    };

    entrepreneurs.push(entrepreneur);

    const server = supertest(app);

    const response = await server.post('/entrepreneurs/auth').send({
      email: 'entrepreneur@mail.com',
      password: '1111',
    });

    expect(response.status).toBe(401);
  });

  it('should return 401 for unauthorized entrepreneur, invalid email', async () => {
    const entrepreneur = {
      id: uuid(),
      email: 'entrepreneur@mail.com',
      password: '12345',
      name: 'Teste',
    };

    entrepreneurs.push(entrepreneur);

    const server = supertest(app);

    const response = await server.post('/entrepreneurs/auth').send({
      email: 'random@mail.com',
      password: '1111',
    });

    expect(response.status).toBe(401);
  });
});
