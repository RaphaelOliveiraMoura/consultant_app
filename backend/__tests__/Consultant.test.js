const supertest = require('supertest');

const app = require('../src/app');
const Consultant = require('../src/models/Consultant');

jest.mock('../src/models/Consultant', () =>
  jest.requireActual('../src/models/Consultant.mock')
);

describe('Consultant', () => {
  beforeEach(() => {
    Consultant.consultants.splice(0, Consultant.consultants);
  });

  it('should create a new consultant', async () => {
    const server = supertest(app);

    expect(Consultant.consultants.length).toBe(0);

    const response = await server.post('/consultants').send({
      specialization: 'tecnology',
      name: 'Raphael',
      email: 'raphael@gmail.com',
      password: '123',
      confirmPassword: '123',
    });

    expect(response.status).toBe(201);
    expect(response.body).toEqual({});

    expect(Consultant.consultants.length).toBe(1);
    expect(Consultant.consultants[0].name).toEqual('Raphael');
  });
});
