#ifndef CSELECTEDBUFFER_H
#define CSELECTEDBUFFER_H
#include "cdefinition.h"
#include "cabstractobjectbase.h"

class CSelectedBuffer
{
public:
    CSelectedBuffer();
    virtual ~CSelectedBuffer();

    SCRectF GetBoundingRectF() const;
    float	GetWidth ();
    float	GetHeight ();
    void	GetCenterPos (float& fPosX, float& fPosY);
    int	    GetCount ();

    void		Append (CAbstractObjectBase* pObject);
    void		Clear ();							   // clear buffer array and clear object selected flag
    bool		Remove (CAbstractObjectBase* pObject); // remove object from buffer array, don't delete object,clear object selected flag

    virtual void        EditDelete();
    virtual void		EditCopy ();
    virtual void		EditCut ();
    virtual bool		EditPaste ();	// add object & add to selectBuffer

    bool	SetWidth (float fWidth);
    bool	SetHeight (float fWidth);
    bool	Offset (float fOffsetX, float fOffsetY);
    bool	Scale (int nDragHandle, float fScaleX, float fScaleY,
                    bool bMirrorX = false, bool bMirrorY = false, SCRectF* pDragBox = 0);
    bool	Rotate (float fAngle, int iRefPointType);
    bool	Mirror (bool bMirroX, bool bMirrorY);
    bool	Skew (float fSkewAngleX, float fSkewAngleY, int iRefPointType);
    int		Combine ();
};

#endif // CSELECTEDBUFFER_H
