const supertest = require('supertest');
const { v4: uuid } = require('uuid');

const app = require('../src/app');
const { consultants } = require('../src/models/Consultant');
const { entrepreneurs } = require('../src/models/Entrepreneur');

jest.mock('../src/models/Consultant', () =>
  jest.requireActual('../src/models/Consultant.mock')
);

jest.mock('../src/models/Entrepreneur', () =>
  jest.requireActual('../src/models/Entrepreneur.mock')
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
});
