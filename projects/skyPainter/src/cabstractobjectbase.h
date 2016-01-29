#ifndef CABSTRACTOBJECTBASE_H
#define CABSTRACTOBJECTBASE_H
#include "cdefinition.h"

class CAbstractObjectBase
{
public:
    CAbstractObjectBase();
    virtual ~CAbstractObjectBase();

    void SetPenStyle(int style);//Qt::PenStyle
    void SetPenWidth(long width);
    void SetPenColor(long color);
    void SetBrush(long color);
    void SetSelected(bool isSelected);
    void SetVisible(bool isVisible);
    void SetEnabled(bool isEnabled);
    bool SetObjectName(const char* pObjName);
    void SetPosition(float x,float y);
    void SetPosition(SCPointF point);
    void SetOpacity(float fOpacity);


    bool  IsSelected() const;
    bool  IsVisible() const;
    bool  IsEnabled() const;
    const char* GetObjectName() const;
    int		GetLayer () const;
    float   Opacity() const;
    float	PosX() const;
    float	PosY() const;
    SCPointF Pos() const;

protected:

};

#endif // CABSTRACTOBJECTBASE_H
