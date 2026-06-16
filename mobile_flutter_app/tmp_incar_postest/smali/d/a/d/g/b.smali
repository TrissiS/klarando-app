.class public Ld/a/d/g/b;
.super Landroid/widget/FrameLayout;
.source "GuideView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ld/a/d/g/b$a;
    }
.end annotation


# instance fields
.field public h:Ld/a/d/g/d;

.field public i:Landroid/graphics/Paint;

.field public j:Landroid/graphics/Path;

.field public k:Landroid/graphics/Path;

.field public l:Ld/a/d/g/b$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ld/a/d/g/d;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    iput-object p2, p0, Ld/a/d/g/b;->h:Ld/a/d/g/d;

    .line 3
    invoke-virtual {p0}, Ld/a/d/g/b;->b()V

    return-void
.end method


# virtual methods
.method public final a(Ld/a/d/g/d$a;Landroid/graphics/Path;)Landroid/graphics/Path;
    .registers 6

    .line 1
    invoke-virtual {p2}, Landroid/graphics/Path;->reset()V

    .line 2
    invoke-virtual {p1}, Ld/a/d/g/d$a;->c()I

    move-result v0

    packed-switch v0, :pswitch_data_3a

    goto :goto_38

    .line 3
    :pswitch_b
    invoke-virtual {p1}, Ld/a/d/g/d$a;->b()Landroid/graphics/RectF;

    move-result-object p1

    sget-object v0, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {p2, p1, v0}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    goto :goto_38

    .line 4
    :pswitch_15
    invoke-virtual {p1}, Ld/a/d/g/d$a;->b()Landroid/graphics/RectF;

    move-result-object p1

    sget-object v0, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {p2, p1, v0}, Landroid/graphics/Path;->addOval(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    goto :goto_38

    .line 5
    :pswitch_1f
    invoke-virtual {p1}, Ld/a/d/g/d$a;->b()Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    .line 6
    invoke-virtual {p1}, Ld/a/d/g/d$a;->b()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    .line 7
    invoke-virtual {p1}, Ld/a/d/g/d$a;->a()F

    move-result p1

    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 8
    invoke-virtual {p2, v0, v1, p1, v2}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    :goto_38
    return-object p2

    nop

    :pswitch_data_3a
    .packed-switch 0x21
        :pswitch_1f
        :pswitch_15
        :pswitch_b
    .end packed-switch
.end method

.method public a()V
    .registers 5

    .line 9
    iget-object v0, p0, Ld/a/d/g/b;->h:Ld/a/d/g/d;

    invoke-virtual {v0}, Ld/a/d/g/d;->c()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_33

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ld/a/d/g/d$a;

    if-eqz v1, :cond_a

    .line 10
    invoke-virtual {v1}, Ld/a/d/g/d$a;->d()Ld/a/d/g/d$b;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 11
    invoke-virtual {v1}, Ld/a/d/g/d$a;->d()Ld/a/d/g/d$b;

    move-result-object v2

    iget v2, v2, Ld/a/d/g/d$b;->a:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_a

    .line 12
    invoke-virtual {v1}, Ld/a/d/g/d$a;->d()Ld/a/d/g/d$b;

    move-result-object v2

    invoke-virtual {v1}, Ld/a/d/g/d$a;->b()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {p0, v2, v1}, Ld/a/d/g/b;->a(Ld/a/d/g/d$b;Landroid/graphics/RectF;)V

    goto :goto_a

    :cond_33
    return-void
.end method

.method public a(Ld/a/d/g/b$a;)V
    .registers 2

    .line 34
    iput-object p1, p0, Ld/a/d/g/b;->l:Ld/a/d/g/b$a;

    return-void
.end method

.method public a(Ld/a/d/g/d$b;Landroid/graphics/RectF;)V
    .registers 11

    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iget v1, p1, Ld/a/d/g/d$b;->a:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 14
    invoke-static {v0}, Ld/a/d/g/a;->a(Landroid/view/View;)I

    move-result v1

    .line 15
    iget-object v3, p1, Ld/a/d/g/d$b;->d:Ld/a/d/g/d$b$a;

    if-nez v3, :cond_1c

    new-instance v3, Ld/a/d/g/d$b$a;

    invoke-direct {v3, v2, v2, v2, v2}, Ld/a/d/g/d$b$a;-><init>(IIII)V

    .line 16
    :cond_1c
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 17
    iget v4, p1, Ld/a/d/g/d$b;->b:I

    const/4 v5, 0x1

    const/4 v6, 0x4

    const/4 v7, 0x3

    if-eq v4, v5, :cond_67

    const/4 v5, 0x2

    if-eq v4, v5, :cond_3d

    .line 18
    iget p1, v3, Ld/a/d/g/d$b$a;->a:I

    iput p1, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 19
    iget p1, v3, Ld/a/d/g/d$b$a;->b:I

    iput p1, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 20
    iget p1, v3, Ld/a/d/g/d$b$a;->d:I

    iput p1, v2, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 21
    iget p1, v3, Ld/a/d/g/d$b$a;->c:I

    iput p1, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    goto :goto_8e

    .line 22
    :cond_3d
    iget v4, p2, Landroid/graphics/RectF;->left:F

    int-to-float v1, v1

    sub-float/2addr v4, v1

    iget v1, v3, Ld/a/d/g/d$b$a;->d:I

    int-to-float v1, v1

    sub-float/2addr v4, v1

    float-to-int v1, v4

    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 23
    iget p1, p1, Ld/a/d/g/d$b;->c:I

    if-eq p1, v7, :cond_5d

    if-eq p1, v6, :cond_53

    .line 24
    iget p1, v3, Ld/a/d/g/d$b$a;->b:I

    iput p1, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    goto :goto_8e

    .line 25
    :cond_53
    iget p1, p2, Landroid/graphics/RectF;->bottom:F

    iget p2, v3, Ld/a/d/g/d$b$a;->b:I

    int-to-float p2, p2

    add-float/2addr p1, p2

    float-to-int p1, p1

    iput p1, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    goto :goto_8e

    .line 26
    :cond_5d
    iget p1, p2, Landroid/graphics/RectF;->top:F

    iget p2, v3, Ld/a/d/g/d$b$a;->b:I

    int-to-float p2, p2

    add-float/2addr p1, p2

    float-to-int p1, p1

    iput p1, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    goto :goto_8e

    .line 27
    :cond_67
    iget v1, p2, Landroid/graphics/RectF;->right:F

    iget v4, v3, Ld/a/d/g/d$b$a;->a:I

    int-to-float v4, v4

    add-float/2addr v1, v4

    float-to-int v1, v1

    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 28
    iget p1, p1, Ld/a/d/g/d$b;->c:I

    if-eq p1, v7, :cond_85

    if-eq p1, v6, :cond_7b

    .line 29
    iget p1, v3, Ld/a/d/g/d$b$a;->b:I

    iput p1, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    goto :goto_8e

    .line 30
    :cond_7b
    iget p1, p2, Landroid/graphics/RectF;->bottom:F

    iget p2, v3, Ld/a/d/g/d$b$a;->b:I

    int-to-float p2, p2

    add-float/2addr p1, p2

    float-to-int p1, p1

    iput p1, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    goto :goto_8e

    .line 31
    :cond_85
    iget p1, p2, Landroid/graphics/RectF;->top:F

    iget p2, v3, Ld/a/d/g/d$b$a;->b:I

    int-to-float p2, p2

    add-float/2addr p1, p2

    float-to-int p1, p1

    iput p1, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 32
    :goto_8e
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 33
    invoke-virtual {p0, v0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final b()V
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/d/g/b;->h:Ld/a/d/g/d;

    invoke-virtual {v0}, Ld/a/d/g/d;->a()I

    move-result v0

    .line 2
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Ld/a/d/g/b;->j:Landroid/graphics/Path;

    .line 3
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Ld/a/d/g/b;->k:Landroid/graphics/Path;

    .line 4
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Ld/a/d/g/b;->i:Landroid/graphics/Paint;

    .line 5
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    iget-object v0, p0, Ld/a/d/g/b;->i:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 7
    iget-object v0, p0, Ld/a/d/g/b;->i:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setWillNotDraw(Z)V

    return-void
.end method

.method public final c()V
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 2
    instance-of v1, v0, Landroid/widget/RelativeLayout;

    if-nez v1, :cond_28

    instance-of v1, v0, Landroid/widget/FrameLayout;

    if-eqz v1, :cond_f

    goto :goto_28

    .line 3
    :cond_f
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 6
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    invoke-virtual {v2, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_2b

    .line 8
    :cond_28
    :goto_28
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 9
    :goto_2b
    iget-object v0, p0, Ld/a/d/g/b;->l:Ld/a/d/g/b$a;

    if-eqz v0, :cond_32

    .line 10
    invoke-interface {v0}, Ld/a/d/g/b$a;->a()V

    :cond_32
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 9

    .line 1
    iget-object v0, p0, Ld/a/d/g/b;->j:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 2
    iget-object v0, p0, Ld/a/d/g/b;->k:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 3
    iget-object v1, p0, Ld/a/d/g/b;->j:Landroid/graphics/Path;

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v0

    int-to-float v4, v0

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v0

    int-to-float v5, v0

    sget-object v6, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 4
    iget-object v0, p0, Ld/a/d/g/b;->h:Ld/a/d/g/d;

    invoke-virtual {v0}, Ld/a/d/g/d;->c()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_27
    :goto_27
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_46

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ld/a/d/g/d$a;

    .line 5
    iget-object v2, p0, Ld/a/d/g/b;->k:Landroid/graphics/Path;

    invoke-virtual {p0, v1, v2}, Ld/a/d/g/b;->a(Ld/a/d/g/d$a;Landroid/graphics/Path;)Landroid/graphics/Path;

    .line 6
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v1, v3, :cond_27

    .line 7
    iget-object v1, p0, Ld/a/d/g/b;->j:Landroid/graphics/Path;

    sget-object v3, Landroid/graphics/Path$Op;->XOR:Landroid/graphics/Path$Op;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    goto :goto_27

    .line 8
    :cond_46
    iget-object v0, p0, Ld/a/d/g/b;->j:Landroid/graphics/Path;

    iget-object v1, p0, Ld/a/d/g/b;->i:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_60

    .line 2
    iget-object v0, p0, Ld/a/d/g/b;->h:Ld/a/d/g/d;

    invoke-virtual {v0}, Ld/a/d/g/d;->e()Landroid/view/View$OnClickListener;

    move-result-object v0

    if-eqz v0, :cond_44

    .line 3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    .line 5
    iget-object v3, p0, Ld/a/d/g/b;->h:Ld/a/d/g/d;

    invoke-virtual {v3}, Ld/a/d/g/d;->b()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_21
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_44

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/RectF;

    .line 6
    invoke-virtual {v4, v0, v2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v4

    if-eqz v4, :cond_21

    .line 7
    iget-object v0, p0, Ld/a/d/g/b;->h:Ld/a/d/g/d;

    invoke-virtual {v0}, Ld/a/d/g/d;->e()Landroid/view/View$OnClickListener;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 8
    invoke-virtual {p0}, Ld/a/d/g/b;->c()V

    .line 9
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    .line 10
    :cond_44
    iget-object p1, p0, Ld/a/d/g/b;->h:Ld/a/d/g/d;

    invoke-virtual {p1}, Ld/a/d/g/d;->d()Landroid/view/View$OnClickListener;

    move-result-object p1

    if-eqz p1, :cond_55

    .line 11
    iget-object p1, p0, Ld/a/d/g/b;->h:Ld/a/d/g/d;

    invoke-virtual {p1}, Ld/a/d/g/d;->d()Landroid/view/View$OnClickListener;

    move-result-object p1

    invoke-interface {p1, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 12
    :cond_55
    iget-object p1, p0, Ld/a/d/g/b;->h:Ld/a/d/g/d;

    invoke-virtual {p1}, Ld/a/d/g/d;->f()Z

    move-result p1

    if-eqz p1, :cond_60

    .line 13
    invoke-virtual {p0}, Ld/a/d/g/b;->c()V

    :cond_60
    return v1
.end method
