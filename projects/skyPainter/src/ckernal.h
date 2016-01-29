#ifndef CKERNAL_H
#define CKERNAL_H

//work area
class CObjectText;

class CKernal
{
public:
    CKernal();
    virtual ~CKernal();
    bool		LoadJobFile (const char* pFileName);
    bool		SaveJobFile (const char* pFileName);
    const char*	GetJobComment ();
    void		SetJobComment (const char* pComment);

    int         GetObjectsCount() const;
    void        Clear();

    int			CreateLayer (long lColor = 0);
    int			GetLayerCount ();
    int			GetCurrentLayer ();
    bool		ChangeLayer (int iLayerNo);							// create and change to return layer index (1, 2...), (0:error)
    bool		DeleteLayer (int iLayerNo);
    bool		UnDeleteLayer (int iLayerNo);
    long		GetLayerColor (int iLayerNo);
    bool		SetLayerColor (int iLayerNo, long lColor);

    CObjectText*	CreateTextObject( int iFlag = 0);

};

#endif // CKERNAL_H
