<?php

namespace App\Controller;
use App\Entity\Qrcode;

use App\Form\SearchType;
use App\Services\QrcodeService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/qrcode")
 */
class DefaultController extends AbstractController
{
    /**
     * @Route("/qr", name="homepage")
     * @param Request $request
     * @param QrcodeService $qrcodeService
     * @return Response
     */
    public function qrcode(Request $request, QrcodeService $qrcodeService): Response
    {
        $qrCode = null;
        $form = $this->createForm(SearchType::class, null);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $data = $form->getData();
            $qrCode = $qrcodeService->qrcode($data['name']);
        }

        return $this->render('evenement/qrcode.html.twig', [
            'form' => $form->createView(),
            'qrCode' => $qrCode
        ]);
    }
}
