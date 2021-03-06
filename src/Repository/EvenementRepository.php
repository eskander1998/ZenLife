<?php

namespace App\Repository;
use App\Entity\Evenement;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;
use App\Entity\FitreRecherche;
use Doctrine\ORM\Query;


class EvenementRepository extends \Doctrine\ORM\EntityRepository
{

    public function FindEventEncours(FitreRecherche $search)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select e from App\Entity\Evenement e where 
                      e.etat LIKE :etat and ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )>=0)")
            ->setParameter('etat', 'en cours');
        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */
        if ($search->getPrixMax()){
            $query=$entityManager
                ->createQuery('select e from App\Entity\Evenement e where 
                      e.tarif <= :PrixMax')
                ->setParameter('PrixMax',  $search->getPrixMax());

        }
        if ($search->getTypeEvent()){

            $query=$entityManager
                ->createQuery('select e from App\Entity\Evenement e where 
                      e.type = :TypeEvent')
                ->setParameter('TypeEvent', $search->getTypeEvent());
        }



        if ($search->getTypeEvent() && $search->getPrixMax()){

            $query=$entityManager
                ->createQuery('select e from App\Entity\Evenement e where 
                      e.type = :TypeEvent and  
                      e.tarif <= :PrixMax ')
                ->setParameter('TypeEvent', $search->getTypeEvent())
                ->setParameter('PrixMax', $search->getPrixMax());

        }
        return $query->getResult() ;

    }


    public function changerEtatEvent()
    {
        $entityManager= $this->getEntityManager();
        $query2=$entityManager
            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0) 
                    ");
        return $query2->getResult();
    }
    public function DecrementerPLace(int $nbPLace,int $idEvent)
    {
        $entityManager= $this->getEntityManager();
        $query2=$entityManager
            ->createQuery("update App\Entity\Evenement e  set e.nbReservation= (e.nbReservation-:nbPlace) where (e.id=:idEvent)")
            ->setParameter('nbPlace', $nbPLace)
            ->setParameter('idEvent', $idEvent);


        return $query2->getResult();
    }


    public function FindReservationEncours($idclient)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select r from App\Entity\ReservationEvent r where 
                      r.etat LIKE :etat and r.idClient=:idClient and ((DATE_DIFF( r.dateEvent,CURRENT_DATE()) )>=0) order by r.id desc")
            ->setParameter('etat', 'en cours')
            ->setParameter('idClient', $idclient);

        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }


    public function FindReservationEncoursThe($idOrganisateur)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select r from App\Entity\ReservationEvent r where 
                      r.etat LIKE :etat and r.idOrganisateur=:idOrganisateur and ((DATE_DIFF( r.dateEvent,CURRENT_DATE()) )>=0) order by r.id desc")
            ->setParameter('etat', 'en cours')
            ->setParameter('idOrganisateur', $idOrganisateur);

        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }


    public function FindReservationEffectuee($idclient)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select r from App\Entity\ReservationEvent r where 
                      r.etat LIKE :etat and r.idClient=:idClient and ((DATE_DIFF( r.dateEvent,CURRENT_DATE()) )<=0)")
            ->setParameter('etat', 'effectue')
            ->setParameter('idClient', $idclient);
        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }


    public function FindReservationEffectueeThe($idclient)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select r from App\Entity\ReservationEvent r where 
                      r.etat LIKE :etat and r.idOrganisateur=:idClient and ((DATE_DIFF( r.dateEvent,CURRENT_DATE()) )<=0)")
            ->setParameter('etat', 'effectue')
            ->setParameter('idClient', $idclient);
        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }

    public function changerEtatReservation()
    {
        $entityManager= $this->getEntityManager();
        $query2=$entityManager
            ->createQuery("update App\Entity\ReservationEvent e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0) 
                    ");
        return $query2->getResult();
    }

    public function ModifierReservation(int $idEvent,int $AncienNbPlace,int $nvNbPlace)
    {
        $entityManager= $this->getEntityManager();
        $query2=$entityManager
            ->createQuery("update App\Entity\Evenement e  set e.nbReservation= ((e.nbReservation-:AncienNbPlace)+:nvNbPlace) where (e.id=:idEvent)
                    ")
            ->setParameter('AncienNbPlace', $AncienNbPlace)
            ->setParameter('nvNbPlace', $nvNbPlace)
            ->setParameter('idEvent', $idEvent);

        return $query2->getResult();
    }

    public function AfficherEvenement(int $idEvent)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select e from App\Entity\Evenement e where 
                     (e.id=:idEvent)")
            ->setParameter('idEvent', $idEvent);
        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }

    public function CompterNbNotif()
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select COUNT(n) from App\Entity\Notifications n ");
        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }

    public function ModifierEtatNotif(int $id)
    {
        $entityManager= $this->getEntityManager();
        $query2=$entityManager
            ->createQuery("update App\Entity\Notifications e  set e.etat= 'lu' where (e.id=:id)
                    ")
            ->setParameter('id', $id);


        return $query2->getResult();
    }


    public function EventLeplusReserver()
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select r   from App\Entity\Evenement r where 
                       r.nbReservation= (SELECT MAX(e.nbReservation)
                              FROM App\Entity\Evenement e
                             WHERE  e.etat LIKE :etat  and ((DATE_DIFF( r.dateEvent,CURRENT_DATE()) )>=0) )")
            ->setParameter('etat', 'en cours');
        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }

    public function DernierEventAjoute()
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select r from App\Entity\Evenement r where 
                      r.id= (SELECT MAX(e.id)
                              FROM App\Entity\Evenement e
                             WHERE  e.etat LIKE :etat)")

            ->setParameter('etat', 'en cours');
        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        // return $query->getResult() ;

        return $this->getDoctrine()
            ->getRepository(EvenementRepository::class)
            ->createQueryBuilder('e')
            ->addOrderBy('e.id', 'desc')
            ->setMaxResults(4)
            ->getQuery()
            ->execute();
    }

    public function FindReservation()
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select r,e from App\Entity\ReservationEvent r,App\Entity\Evenement e where 
                     e.id = r.idEvent")
            ->setParameter('etat', 'en cours');
        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }
    public function AfficherEvenementencours(FitreRecherche $search,$idorga)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select e from App\Entity\Evenement e where 
                     (e.etat=:etat)and e.idOrganisateur=:idorga")
            ->setParameter('etat', 'en cours')
            ->setParameter('idorga', $idorga);

        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */

        if ($search->getPrixMax()){
            $query=$entityManager
                ->createQuery('select e from App\Entity\Evenement e where 
                      e.tarif <= :PrixMax')
                ->setParameter('PrixMax',  $search->getPrixMax());

        }
        if ($search->getTypeEvent()){

            $query=$entityManager
                ->createQuery('select e from App\Entity\Evenement e where 
                      e.type = :TypeEvent')
                ->setParameter('TypeEvent', $search->getTypeEvent());
        }



        if ($search->getTypeEvent() && $search->getPrixMax()){

            $query=$entityManager
                ->createQuery('select e from App\Entity\Evenement e where 
                      e.type = :TypeEvent and  
                      e.tarif <= :PrixMax ')
                ->setParameter('TypeEvent', $search->getTypeEvent())
                ->setParameter('PrixMax', $search->getPrixMax());

        }

        if ($search->getDateDebut() && $search->getDateFin() && $search->getTypeEvent() && $search->getPrixMax()){

            $query=$entityManager
                ->createQuery('select e from App\Entity\Evenement e where 
                      ((e.dateEvent between :datedebut and :datefin) and e.type = :TypeEvent and  
                      e.tarif <= :PrixMax )')
                ->setParameter('datedebut', $search->getDateDebut())
                ->setParameter('datefin', $search->getDateFin())
                ->setParameter('TypeEvent', $search->getTypeEvent())
                ->setParameter('PrixMax', $search->getPrixMax());

        }

        if ($search->getDateDebut() && $search->getDateFin()){

            $query=$entityManager
                ->createQuery('select e from App\Entity\Evenement e where 
                      (e.dateEvent between :datedebut and :datefin)')
                ->setParameter('datedebut', $search->getDateDebut())
                ->setParameter('datefin', $search->getDateFin());

        }


        return $query->getResult() ;

    }

    public function AfficherEvenementeffectue($idorga)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select e from App\Entity\Evenement e where 
                     (e.etat=:etat) and e.idOrganisateur=:idorga")
            ->setParameter('etat', 'effectue')
            ->setParameter('idorga', $idorga);

        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }

    public function detailReservationEvent(int $idEvent)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select e from App\Entity\ReservationEvent e where 
                     (e.idEvent=:idEvent)")
            ->setParameter('idEvent', $idEvent);
        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }


    public function StatTypeEventleplusreserver()
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("SELECT sum(e.nbReservation) as reserv,e.type  FROM App\Entity\Evenement e group by e.type ");
        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }

    public function modePaiementleplusUtiliser()
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("SELECT r.modePaiement,count(r.modePaiement) as countM FROM App\Entity\ReservationEvent r  group by r.modePaiement ");
        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }

    public function StatEvolutionReservation($idorga)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("SELECT sum(e.nbReservation) as reserve,e.titre  FROM App\Entity\Evenement e where e.etat =:etat and e.idOrganisateur=:idorga group by e.titre  ")
            ->setParameter('etat', 'en cours')
            ->setParameter('idorga', $idorga);
        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }

    public function statEtatEvenement($idorga)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("SELECT r.etat,count(r.etat) as countEtat FROM App\Entity\Evenement r where r.idOrganisateur=:idorga  group by r.etat ")
            ->setParameter('idorga', $idorga);
        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }

    public function statProgressionEvenement($idorga)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select e from App\Entity\Evenement e where  (e.etat=:etat) and e.idOrganisateur=:idorga
")
            ->setParameter('etat', 'en cours')
            ->setParameter('idorga', $idorga);

        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }

    public function RappelEvent($idorga)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select e from App\Entity\Evenement e where (DATE_DIFF( e.dateEvent,CURRENT_DATE()) <6) and (e.etat=:etat) and e.idOrganisateur=:idorga")
            ->setParameter('etat', 'en cours')
            ->setParameter('idorga', $idorga);

        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }

    public function NomDuclient()
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select e from App\Entity\User e ");


        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }


    public function nbReservationTotal($idorga)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select COUNT(e)  as total from App\Entity\ReservationEvent e where  e.idOrganisateur=:idorga ")
            ->setParameter('idorga', $idorga);
        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }

    public function nbNouvellereservation($idorga)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("select COUNT(e)  as total from App\Entity\Notifications e where  e.motif=:idorga ")
            ->setParameter('idorga', $idorga);
        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }

    public function RevenueEnligne($idorga)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("SELECT sum(e.total) as total  FROM App\Entity\ReservationEvent e where e.modePaiement=:enligne and
           e.idOrganisateur=:idorga ")
            ->setParameter('enligne', 'en ligne')
            ->setParameter('idorga', $idorga);

        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }

    public function RevenuesurplaceEffectue($idorga)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("SELECT sum(e.total) as total  FROM App\Entity\ReservationEvent e where e.modePaiement=:surplace and
           e.idOrganisateur=:idorga and e.etat=:effectue ")
            ->setParameter('surplace', 'sur place')
            ->setParameter('effectue', 'effectue')
            ->setParameter('idorga', $idorga);

        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }


    public function RevenuesurplaceAvenir($idorga)
    {
        $entityManager= $this->getEntityManager();

        $query=$entityManager
            ->createQuery("SELECT sum(e.total) as total  FROM App\Entity\ReservationEvent e where e.modePaiement=:surplace and
           e.idOrganisateur=:idorga and e.etat=:effectue ")
            ->setParameter('surplace', 'sur place')
            ->setParameter('effectue', 'en cours')
            ->setParameter('idorga', $idorga);

        /*
                        $query2=$entityManager
                            ->createQuery("update App\Entity\Evenement e  set e.etat= 'effectue' where ((DATE_DIFF( e.dateEvent,CURRENT_DATE()) )<=0)
                            ");
        */


        return $query->getResult() ;

    }
}


