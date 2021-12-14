const express = require('express');
const {
  getTrainings,
  getTeilnehmerWithTraining,
  deleteTeilnehmer,
  postTeilnehmer,
  getTeilnehmers,
  postTraining,
  getTeilnehmerAnzahlUndStatus,
  deleteTraining,
} = require('../controllers/simple2train');

const router = express.Router();

router.get('/teilnehmer', getTeilnehmers);
router.get('/trainings', getTrainings);
router.get('/training/:trainingsid', getTeilnehmerWithTraining);
router.delete('/teilnehmer/:id', deleteTeilnehmer);
router.delete('/training/:id', deleteTraining);
router.post('/teilnehmer', postTeilnehmer);
router.post('/training', postTraining);
router.get('/trainingteilnehmer/:id', getTeilnehmerAnzahlUndStatus);

module.exports = router;
