const supertest = require('supertest');
const { v4: uuid } = require('uuid');

const app = require('../src/app');
const {
  ratings: ratingsConsultant,
} = require('../src/repositories/RatingConsultant');
const {
  ratings: ratingsEntrepreneur,
} = require('../src/repositories/RatingEntrepreneur');
const { questions } = require('../src/repositories/RatingQuestion');
const { consultants } = require('../src/repositories/Consultant');
const { entrepreneurs } = require('../src/repositories/Entrepreneur');

jest.mock('../src/repositories/RatingQuestion', () =>
  jest.requireActual('../src/repositories/RatingQuestion.mock')
);

jest.mock('../src/repositories/RatingConsultant', () =>
  jest.requireActual('../src/repositories/RatingConsultant.mock')
);

jest.mock('../src/repositories/RatingEntrepreneur', () =>
  jest.requireActual('../src/repositories/RatingEntrepreneur.mock')
);

jest.mock('../src/repositories/Consultant', () =>
  jest.requireActual('../src/repositories/Consultant.mock')
);

jest.mock('../src/repositories/Entrepreneur', () =>
  jest.requireActual('../src/repositories/Entrepreneur.mock')
);

describe('Consultant', () => {
  beforeEach(() => {
    questions.splice(0, questions.length);
    ratingsConsultant.splice(0, ratingsConsultant.length);
    ratingsEntrepreneur.splice(0, ratingsEntrepreneur.length);
    consultants.splice(0, consultants.length);
  });

  it('should list default ratings for consultants', async () => {
    const consultant = {
      id: uuid(),
      specialization: 'tecnology',
      name: 'Teste',
      email: 'teste@gmail.com',
      password: '123',
    };

    consultants.push(consultant);

    questions.push(
      { id: 1, title: 'Question1' },
      { id: 2, title: 'Question2' },
      { id: 3, title: 'Question3' }
    );

    const server = await app.createServer();
    const api = supertest(server);

    const response = await api
      .get('/consultants/ratings')
      .set('Authorization', consultant.id);

    expect(response.status).toBe(200);
    expect(response.body[0].question.title).toBe('Question1');
    expect(response.body[0].rating).toBe(0);

    expect(response.body[1].question.title).toBe('Question2');
    expect(response.body[1].rating).toBe(0);

    expect(response.body[2].question.title).toBe('Question3');
    expect(response.body[2].rating).toBe(0);
  });

  it('should list ratings for consultants', async () => {
    const consultant = {
      id: uuid(),
      specialization: 'tecnology',
      name: 'Teste',
      email: 'teste@gmail.com',
      password: '123',
    };

    consultants.push(consultant);

    questions.push(
      { id: 1, title: 'Question1' },
      { id: 2, title: 'Question2' },
      { id: 3, title: 'Question3' }
    );

    ratingsConsultant.push(
      {
        consultantId: consultant.id,
        questionId: 1,
        rating: 4,
      },
      {
        consultantId: consultant.id,
        questionId: 2,
        rating: 1,
      }
    );

    const server = await app.createServer();
    const api = supertest(server);

    const response = await api
      .get('/consultants/ratings')
      .set('Authorization', consultant.id);

    expect(response.status).toBe(200);
    expect(response.body[0].question.title).toBe('Question1');
    expect(response.body[0].rating).toBe(4);

    expect(response.body[1].question.title).toBe('Question2');
    expect(response.body[1].rating).toBe(1);

    expect(response.body[2].question.title).toBe('Question3');
    expect(response.body[2].rating).toBe(0);
  });

  it('should create a rate for question by consultant', async () => {
    const consultant = {
      id: uuid(),
      specialization: 'tecnology',
      name: 'Teste',
      email: 'teste@gmail.com',
      password: '123',
    };

    consultants.push(consultant);

    questions.push(
      { id: 1, title: 'Question1' },
      { id: 2, title: 'Question2' },
      { id: 3, title: 'Question3' }
    );

    const server = await app.createServer();
    const api = supertest(server);

    expect(ratingsConsultant.length).toBe(0);

    const response = await api
      .put('/consultants/ratings')
      .set('Authorization', consultant.id)
      .send({
        questionId: 1,
        rating: 3,
      });

    expect(response.status).toBe(200);

    expect(ratingsConsultant.length).toBe(1);

    expect(ratingsConsultant[0].questionId).toBe(1);
    expect(ratingsConsultant[0].consultantId).toBe(consultant.id);
    expect(ratingsConsultant[0].rating).toBe(3);
  });

  it('should update a rate for question by consultant', async () => {
    const consultant = {
      id: uuid(),
      specialization: 'tecnology',
      name: 'Teste',
      email: 'teste@gmail.com',
      password: '123',
    };

    consultants.push(consultant);

    questions.push(
      { id: 1, title: 'Question1' },
      { id: 2, title: 'Question2' },
      { id: 3, title: 'Question3' }
    );

    ratingsConsultant.push({
      consultantId: consultant.id,
      questionId: 1,
      rating: 5,
    });
    const server = await app.createServer();

    const api = supertest(server);

    expect(ratingsConsultant.length).toBe(1);

    const response = await api
      .put('/consultants/ratings')
      .set('Authorization', consultant.id)
      .send({
        questionId: 1,
        rating: 3,
      });

    expect(response.status).toBe(200);

    expect(ratingsConsultant.length).toBe(1);

    expect(ratingsConsultant[0].questionId).toBe(1);
    expect(ratingsConsultant[0].consultantId).toBe(consultant.id);
    expect(ratingsConsultant[0].rating).toBe(3);
  });

  it('should list default ratings for entrepreneurs', async () => {
    const entrepreneur = {
      id: uuid(),
      name: 'Teste',
      email: 'teste@gmail.com',
      password: '123',
    };

    entrepreneurs.push(entrepreneur);

    questions.push(
      { id: 1, title: 'Question1' },
      { id: 2, title: 'Question2' },
      { id: 3, title: 'Question3' }
    );
    const server = await app.createServer();

    const api = supertest(server);

    const response = await api
      .get('/entrepreneurs/ratings')
      .set('Authorization', entrepreneur.id);

    expect(response.status).toBe(200);
    expect(response.body[0].question.title).toBe('Question1');
    expect(response.body[0].rating).toBe(0);

    expect(response.body[1].question.title).toBe('Question2');
    expect(response.body[1].rating).toBe(0);

    expect(response.body[2].question.title).toBe('Question3');
    expect(response.body[2].rating).toBe(0);
  });

  it('should list ratings for entrepreneurs', async () => {
    const entrepreneur = {
      id: uuid(),
      specialization: 'tecnology',
      name: 'Teste',
      email: 'teste@gmail.com',
      password: '123',
    };

    entrepreneurs.push(entrepreneur);

    questions.push(
      { id: 1, title: 'Question1' },
      { id: 2, title: 'Question2' },
      { id: 3, title: 'Question3' }
    );

    ratingsEntrepreneur.push(
      {
        entrepreneurId: entrepreneur.id,
        questionId: 1,
        rating: 4,
      },
      {
        entrepreneurId: entrepreneur.id,
        questionId: 2,
        rating: 1,
      }
    );
    const server = await app.createServer();

    const api = supertest(server);

    const response = await api
      .get('/entrepreneurs/ratings')
      .set('Authorization', entrepreneur.id);

    expect(response.status).toBe(200);
    expect(response.body[0].question.title).toBe('Question1');
    expect(response.body[0].rating).toBe(4);

    expect(response.body[1].question.title).toBe('Question2');
    expect(response.body[1].rating).toBe(1);

    expect(response.body[2].question.title).toBe('Question3');
    expect(response.body[2].rating).toBe(0);
  });

  it('should create a rate for question by entrepreneurs', async () => {
    const entrepreneur = {
      id: uuid(),
      specialization: 'tecnology',
      name: 'Teste',
      email: 'teste@gmail.com',
      password: '123',
    };

    entrepreneurs.push(entrepreneur);

    questions.push(
      { id: 1, title: 'Question1' },
      { id: 2, title: 'Question2' },
      { id: 3, title: 'Question3' }
    );

    const server = await app.createServer();
    const api = supertest(server);

    expect(ratingsEntrepreneur.length).toBe(0);

    const response = await api
      .put('/entrepreneurs/ratings')
      .set('Authorization', entrepreneur.id)
      .send({
        questionId: 1,
        rating: 3,
      });

    expect(response.status).toBe(200);

    expect(ratingsEntrepreneur.length).toBe(1);

    expect(ratingsEntrepreneur[0].questionId).toBe(1);
    expect(ratingsEntrepreneur[0].entrepreneurId).toBe(entrepreneur.id);
    expect(ratingsEntrepreneur[0].rating).toBe(3);
  });

  it('should update a rate for question by entrepreneurs', async () => {
    const entrepreneur = {
      id: uuid(),
      specialization: 'tecnology',
      name: 'Teste',
      email: 'teste@gmail.com',
      password: '123',
    };

    entrepreneurs.push(entrepreneur);

    questions.push(
      { id: 1, title: 'Question1' },
      { id: 2, title: 'Question2' },
      { id: 3, title: 'Question3' }
    );

    ratingsEntrepreneur.push({
      entrepreneurId: entrepreneur.id,
      questionId: 1,
      rating: 5,
    });

    const server = await app.createServer();
    const api = supertest(server);

    expect(ratingsEntrepreneur.length).toBe(1);

    const response = await api
      .put('/entrepreneurs/ratings')
      .set('Authorization', entrepreneur.id)
      .send({
        questionId: 1,
        rating: 3,
      });

    expect(response.status).toBe(200);

    expect(ratingsEntrepreneur.length).toBe(1);

    expect(ratingsEntrepreneur[0].questionId).toBe(1);
    expect(ratingsEntrepreneur[0].entrepreneurId).toBe(entrepreneur.id);
    expect(ratingsEntrepreneur[0].rating).toBe(3);
  });
});
