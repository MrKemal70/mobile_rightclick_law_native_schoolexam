<?php

namespace App\Http\Controllers;

use App\Models\Document;
use Illuminate\Http\Request;

class DocumentController extends Controller
{
    public function getDocumentLength()
    {
        $documents = Document::all();

        foreach ($documents as $document)
        {
            $documentsarray[] = [
                'doc_name' => $document->DOC_NAME,
                ];
        }

        try {
            $count = count($documentsarray);
        }
        catch (\Exception $e) {
            $count = 0;
        }

        return $count;
    }
}
