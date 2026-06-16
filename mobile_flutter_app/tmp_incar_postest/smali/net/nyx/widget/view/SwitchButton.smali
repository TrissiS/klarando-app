.class public final Lnet/nyx/widget/view/SwitchButton;
.super Landroid/view/View;
.source "SwitchButton.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/nyx/widget/view/SwitchButton$SavedState;,
        Lnet/nyx/widget/view/SwitchButton$b;
    }
.end annotation


# instance fields
.field public A:F

.field public B:F

.field public C:F

.field public D:F

.field public E:F

.field public F:F

.field public G:F

.field public H:F

.field public I:F

.field public J:F

.field public K:F

.field public L:F

.field public M:F

.field public N:F

.field public O:F

.field public final h:Landroid/view/animation/AccelerateInterpolator;

.field public final i:Landroid/graphics/Paint;

.field public final j:Landroid/graphics/Path;

.field public final k:Landroid/graphics/Path;

.field public final l:Landroid/graphics/RectF;

.field public m:F

.field public n:F

.field public o:Landroid/graphics/RadialGradient;

.field public p:I

.field public q:I

.field public r:Z

.field public s:Z

.field public t:Z

.field public u:I

.field public v:I

.field public w:I

.field public x:I

.field public y:I

.field public z:Lnet/nyx/widget/view/SwitchButton$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lnet/nyx/widget/view/SwitchButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lnet/nyx/widget/view/SwitchButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5

    const/4 v0, 0x0

    .line 3
    invoke-direct {p0, p1, p2, p3, v0}, Lnet/nyx/widget/view/SwitchButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5

    .line 4
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 5
    new-instance p3, Landroid/view/animation/AccelerateInterpolator;

    const/high16 p4, 0x40000000    # 2.0f

    invoke-direct {p3, p4}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    iput-object p3, p0, Lnet/nyx/widget/view/SwitchButton;->h:Landroid/view/animation/AccelerateInterpolator;

    .line 6
    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    iput-object p3, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    .line 7
    new-instance p3, Landroid/graphics/Path;

    invoke-direct {p3}, Landroid/graphics/Path;-><init>()V

    iput-object p3, p0, Lnet/nyx/widget/view/SwitchButton;->j:Landroid/graphics/Path;

    .line 8
    new-instance p3, Landroid/graphics/Path;

    invoke-direct {p3}, Landroid/graphics/Path;-><init>()V

    iput-object p3, p0, Lnet/nyx/widget/view/SwitchButton;->k:Landroid/graphics/Path;

    .line 9
    new-instance p3, Landroid/graphics/RectF;

    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    iput-object p3, p0, Lnet/nyx/widget/view/SwitchButton;->l:Landroid/graphics/RectF;

    const/4 p3, 0x0

    .line 10
    iput-boolean p3, p0, Lnet/nyx/widget/view/SwitchButton;->r:Z

    const p3, -0xb4289d

    .line 11
    iput p3, p0, Lnet/nyx/widget/view/SwitchButton;->u:I

    const p3, -0xc539ae

    .line 12
    iput p3, p0, Lnet/nyx/widget/view/SwitchButton;->v:I

    const p3, -0x1c1c1d

    .line 13
    iput p3, p0, Lnet/nyx/widget/view/SwitchButton;->w:I

    const p3, -0x404041

    .line 14
    iput p3, p0, Lnet/nyx/widget/view/SwitchButton;->x:I

    const p3, -0xcccccd

    .line 15
    iput p3, p0, Lnet/nyx/widget/view/SwitchButton;->y:I

    const/4 p3, 0x1

    const/4 p4, 0x0

    .line 16
    invoke-virtual {p0, p3, p4}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 17
    sget-object p4, Ld/a/d/f;->SwitchButton:[I

    invoke-virtual {p1, p2, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 18
    sget p2, Ld/a/d/f;->SwitchButton_android_checked:I

    iget-boolean p4, p0, Lnet/nyx/widget/view/SwitchButton;->t:Z

    invoke-virtual {p1, p2, p4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lnet/nyx/widget/view/SwitchButton;->t:Z

    .line 19
    sget p2, Ld/a/d/f;->SwitchButton_android_enabled:I

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result p4

    invoke-virtual {p1, p2, p4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    invoke-virtual {p0, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 20
    iget-boolean p2, p0, Lnet/nyx/widget/view/SwitchButton;->t:Z

    if-eqz p2, :cond_6b

    const/4 p3, 0x3

    :cond_6b
    iput p3, p0, Lnet/nyx/widget/view/SwitchButton;->q:I

    iput p3, p0, Lnet/nyx/widget/view/SwitchButton;->p:I

    .line 21
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public final a(F)V
    .registers 9

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/view/SwitchButton;->k:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 2
    iget-object v0, p0, Lnet/nyx/widget/view/SwitchButton;->l:Landroid/graphics/RectF;

    iget v1, p0, Lnet/nyx/widget/view/SwitchButton;->I:F

    iget v2, p0, Lnet/nyx/widget/view/SwitchButton;->G:F

    const/high16 v3, 0x40000000    # 2.0f

    div-float v4, v2, v3

    add-float/2addr v1, v4

    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 3
    iget v1, p0, Lnet/nyx/widget/view/SwitchButton;->J:F

    div-float/2addr v2, v3

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 4
    iget-object v1, p0, Lnet/nyx/widget/view/SwitchButton;->k:Landroid/graphics/Path;

    const/high16 v2, 0x43340000    # 180.0f

    const/high16 v4, 0x42b40000    # 90.0f

    invoke-virtual {v1, v0, v4, v2}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 5
    iget-object v0, p0, Lnet/nyx/widget/view/SwitchButton;->l:Landroid/graphics/RectF;

    iget v1, p0, Lnet/nyx/widget/view/SwitchButton;->I:F

    iget v4, p0, Lnet/nyx/widget/view/SwitchButton;->E:F

    mul-float v5, p1, v4

    add-float/2addr v1, v5

    iget v5, p0, Lnet/nyx/widget/view/SwitchButton;->G:F

    div-float v6, v5, v3

    add-float/2addr v1, v6

    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 6
    iget v1, p0, Lnet/nyx/widget/view/SwitchButton;->J:F

    mul-float p1, p1, v4

    add-float/2addr v1, p1

    div-float/2addr v5, v3

    sub-float/2addr v1, v5

    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 7
    iget-object p1, p0, Lnet/nyx/widget/view/SwitchButton;->k:Landroid/graphics/Path;

    const/high16 v1, 0x43870000    # 270.0f

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 8
    iget-object p1, p0, Lnet/nyx/widget/view/SwitchButton;->k:Landroid/graphics/Path;

    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    return-void
.end method

.method public a(ZZ)V
    .registers 9

    const/4 v0, 0x3

    const/4 v1, 0x1

    if-eqz p1, :cond_6

    const/4 v2, 0x3

    goto :goto_7

    :cond_6
    const/4 v2, 0x1

    .line 9
    :goto_7
    iget v3, p0, Lnet/nyx/widget/view/SwitchButton;->q:I

    if-ne v2, v3, :cond_c

    return-void

    :cond_c
    const/high16 v4, 0x3f800000    # 1.0f

    if-ne v2, v0, :cond_15

    if-eq v3, v1, :cond_1e

    const/4 v5, 0x2

    if-eq v3, v5, :cond_1e

    :cond_15
    if-ne v2, v1, :cond_20

    .line 10
    iget v3, p0, Lnet/nyx/widget/view/SwitchButton;->q:I

    if-eq v3, v0, :cond_1e

    const/4 v5, 0x4

    if-ne v3, v5, :cond_20

    .line 11
    :cond_1e
    iput v4, p0, Lnet/nyx/widget/view/SwitchButton;->m:F

    .line 12
    :cond_20
    iput v4, p0, Lnet/nyx/widget/view/SwitchButton;->n:F

    .line 13
    iget-boolean v3, p0, Lnet/nyx/widget/view/SwitchButton;->t:Z

    if-nez v3, :cond_2b

    if-ne v2, v0, :cond_2b

    .line 14
    iput-boolean v1, p0, Lnet/nyx/widget/view/SwitchButton;->t:Z

    goto :goto_34

    .line 15
    :cond_2b
    iget-boolean v0, p0, Lnet/nyx/widget/view/SwitchButton;->t:Z

    if-eqz v0, :cond_34

    if-ne v2, v1, :cond_34

    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lnet/nyx/widget/view/SwitchButton;->t:Z

    .line 17
    :cond_34
    :goto_34
    iget v0, p0, Lnet/nyx/widget/view/SwitchButton;->q:I

    iput v0, p0, Lnet/nyx/widget/view/SwitchButton;->p:I

    .line 18
    iput v2, p0, Lnet/nyx/widget/view/SwitchButton;->q:I

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    if-eqz p2, :cond_46

    .line 20
    iget-object p2, p0, Lnet/nyx/widget/view/SwitchButton;->z:Lnet/nyx/widget/view/SwitchButton$b;

    if-eqz p2, :cond_46

    .line 21
    invoke-interface {p2, p0, p1}, Lnet/nyx/widget/view/SwitchButton$b;->a(Lnet/nyx/widget/view/SwitchButton;Z)V

    :cond_46
    return-void
.end method

.method public final b(F)F
    .registers 8

    .line 1
    iget v0, p0, Lnet/nyx/widget/view/SwitchButton;->q:I

    iget v1, p0, Lnet/nyx/widget/view/SwitchButton;->p:I

    sub-int v1, v0, v1

    const/4 v2, -0x3

    if-eq v1, v2, :cond_64

    const/4 v2, -0x2

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eq v1, v2, :cond_54

    const/4 v2, -0x1

    const/4 v5, 0x4

    if-eq v1, v2, :cond_48

    const/4 v2, 0x3

    if-eq v1, v4, :cond_3c

    if-eq v1, v3, :cond_2e

    if-eq v1, v2, :cond_23

    if-ne v0, v4, :cond_1e

    .line 2
    iget p1, p0, Lnet/nyx/widget/view/SwitchButton;->N:F

    goto :goto_6d

    :cond_1e
    if-ne v0, v2, :cond_62

    .line 3
    iget p1, p0, Lnet/nyx/widget/view/SwitchButton;->K:F

    goto :goto_6d

    .line 4
    :cond_23
    iget v0, p0, Lnet/nyx/widget/view/SwitchButton;->K:F

    iget v1, p0, Lnet/nyx/widget/view/SwitchButton;->N:F

    :goto_27
    sub-float v1, v0, v1

    mul-float v1, v1, p1

    sub-float p1, v0, v1

    goto :goto_6d

    :cond_2e
    if-ne v0, v2, :cond_35

    .line 5
    iget v0, p0, Lnet/nyx/widget/view/SwitchButton;->K:F

    iget v1, p0, Lnet/nyx/widget/view/SwitchButton;->N:F

    goto :goto_27

    :cond_35
    if-ne v0, v5, :cond_62

    .line 6
    iget v0, p0, Lnet/nyx/widget/view/SwitchButton;->L:F

    iget v1, p0, Lnet/nyx/widget/view/SwitchButton;->N:F

    goto :goto_27

    :cond_3c
    if-ne v0, v3, :cond_41

    .line 7
    iget p1, p0, Lnet/nyx/widget/view/SwitchButton;->N:F

    goto :goto_6d

    :cond_41
    if-ne v0, v2, :cond_62

    .line 8
    iget v0, p0, Lnet/nyx/widget/view/SwitchButton;->K:F

    iget v1, p0, Lnet/nyx/widget/view/SwitchButton;->L:F

    goto :goto_27

    :cond_48
    if-ne v0, v5, :cond_4f

    .line 9
    iget v0, p0, Lnet/nyx/widget/view/SwitchButton;->L:F

    iget v1, p0, Lnet/nyx/widget/view/SwitchButton;->K:F

    goto :goto_68

    :cond_4f
    if-ne v0, v4, :cond_62

    .line 10
    iget p1, p0, Lnet/nyx/widget/view/SwitchButton;->N:F

    goto :goto_6d

    :cond_54
    if-ne v0, v4, :cond_5b

    .line 11
    iget v0, p0, Lnet/nyx/widget/view/SwitchButton;->N:F

    iget v1, p0, Lnet/nyx/widget/view/SwitchButton;->L:F

    goto :goto_68

    :cond_5b
    if-ne v0, v3, :cond_62

    .line 12
    iget v0, p0, Lnet/nyx/widget/view/SwitchButton;->M:F

    iget v1, p0, Lnet/nyx/widget/view/SwitchButton;->K:F

    goto :goto_68

    :cond_62
    const/4 p1, 0x0

    goto :goto_6d

    .line 13
    :cond_64
    iget v0, p0, Lnet/nyx/widget/view/SwitchButton;->N:F

    iget v1, p0, Lnet/nyx/widget/view/SwitchButton;->K:F

    :goto_68
    sub-float/2addr v1, v0

    mul-float v1, v1, p1

    add-float p1, v0, v1

    .line 14
    :goto_6d
    iget v0, p0, Lnet/nyx/widget/view/SwitchButton;->N:F

    sub-float/2addr p1, v0

    return p1
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 13

    .line 1
    iget-boolean v0, p0, Lnet/nyx/widget/view/SwitchButton;->r:Z

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    iget-object v0, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 3
    iget v0, p0, Lnet/nyx/widget/view/SwitchButton;->q:I

    const/4 v2, 0x3

    const/4 v3, 0x0

    const/4 v4, 0x4

    if-eq v0, v2, :cond_17

    if-ne v0, v4, :cond_15

    goto :goto_17

    :cond_15
    const/4 v0, 0x0

    goto :goto_18

    :cond_17
    :goto_17
    const/4 v0, 0x1

    .line 4
    :goto_18
    iget-object v2, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 5
    iget-object v2, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    if-eqz v0, :cond_26

    iget v5, p0, Lnet/nyx/widget/view/SwitchButton;->u:I

    goto :goto_28

    :cond_26
    iget v5, p0, Lnet/nyx/widget/view/SwitchButton;->w:I

    :goto_28
    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    iget-object v2, p0, Lnet/nyx/widget/view/SwitchButton;->j:Landroid/graphics/Path;

    iget-object v5, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 7
    iget v2, p0, Lnet/nyx/widget/view/SwitchButton;->m:F

    const v5, 0x3dcccccd    # 0.1f

    sub-float v6, v2, v5

    const/4 v7, 0x0

    cmpl-float v6, v6, v7

    if-lez v6, :cond_40

    sub-float/2addr v2, v5

    goto :goto_41

    :cond_40
    const/4 v2, 0x0

    :goto_41
    iput v2, p0, Lnet/nyx/widget/view/SwitchButton;->m:F

    .line 8
    iget v2, p0, Lnet/nyx/widget/view/SwitchButton;->n:F

    sub-float v6, v2, v5

    cmpl-float v6, v6, v7

    if-lez v6, :cond_4d

    sub-float/2addr v2, v5

    goto :goto_4e

    :cond_4d
    const/4 v2, 0x0

    :goto_4e
    iput v2, p0, Lnet/nyx/widget/view/SwitchButton;->n:F

    .line 9
    iget-object v2, p0, Lnet/nyx/widget/view/SwitchButton;->h:Landroid/view/animation/AccelerateInterpolator;

    iget v5, p0, Lnet/nyx/widget/view/SwitchButton;->m:F

    invoke-virtual {v2, v5}, Landroid/view/animation/AccelerateInterpolator;->getInterpolation(F)F

    move-result v2

    .line 10
    iget-object v5, p0, Lnet/nyx/widget/view/SwitchButton;->h:Landroid/view/animation/AccelerateInterpolator;

    iget v6, p0, Lnet/nyx/widget/view/SwitchButton;->n:F

    invoke-virtual {v5, v6}, Landroid/view/animation/AccelerateInterpolator;->getInterpolation(F)F

    move-result v5

    .line 11
    iget v6, p0, Lnet/nyx/widget/view/SwitchButton;->D:F

    const/high16 v8, 0x3f800000    # 1.0f

    if-eqz v0, :cond_68

    move v9, v2

    goto :goto_6a

    :cond_68
    sub-float v9, v8, v2

    :goto_6a
    mul-float v6, v6, v9

    .line 12
    iget v9, p0, Lnet/nyx/widget/view/SwitchButton;->A:F

    iget v10, p0, Lnet/nyx/widget/view/SwitchButton;->B:F

    sub-float/2addr v9, v10

    iget v10, p0, Lnet/nyx/widget/view/SwitchButton;->F:F

    sub-float/2addr v9, v10

    if-eqz v0, :cond_78

    sub-float v2, v8, v2

    :cond_78
    mul-float v9, v9, v2

    .line 13
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 14
    iget v2, p0, Lnet/nyx/widget/view/SwitchButton;->B:F

    add-float/2addr v2, v9

    iget v9, p0, Lnet/nyx/widget/view/SwitchButton;->C:F

    invoke-virtual {p1, v6, v6, v2, v9}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v2

    const/4 v6, -0x1

    if-eqz v2, :cond_92

    .line 16
    iget-object v2, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    invoke-virtual {v2, v6}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_9a

    .line 17
    :cond_92
    iget-object v2, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    const v9, -0x444445

    invoke-virtual {v2, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 18
    :goto_9a
    iget-object v2, p0, Lnet/nyx/widget/view/SwitchButton;->j:Landroid/graphics/Path;

    iget-object v9, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v9}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 19
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 20
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 21
    invoke-virtual {p0, v5}, Lnet/nyx/widget/view/SwitchButton;->b(F)F

    move-result v2

    iget v9, p0, Lnet/nyx/widget/view/SwitchButton;->O:F

    invoke-virtual {p1, v2, v9}, Landroid/graphics/Canvas;->translate(FF)V

    .line 22
    iget v2, p0, Lnet/nyx/widget/view/SwitchButton;->q:I

    if-eq v2, v4, :cond_b9

    const/4 v4, 0x2

    if-ne v2, v4, :cond_b8

    goto :goto_b9

    :cond_b8
    const/4 v1, 0x0

    :cond_b9
    :goto_b9
    if-eqz v1, :cond_bd

    sub-float v5, v8, v5

    .line 23
    :cond_bd
    invoke-virtual {p0, v5}, Lnet/nyx/widget/view/SwitchButton;->a(F)V

    .line 24
    iget-boolean v1, p0, Lnet/nyx/widget/view/SwitchButton;->s:Z

    if-eqz v1, :cond_df

    .line 25
    iget-object v1, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 26
    iget-object v1, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    iget-object v2, p0, Lnet/nyx/widget/view/SwitchButton;->o:Landroid/graphics/RadialGradient;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 27
    iget-object v1, p0, Lnet/nyx/widget/view/SwitchButton;->k:Landroid/graphics/Path;

    iget-object v2, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 28
    iget-object v1, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 29
    :cond_df
    iget v1, p0, Lnet/nyx/widget/view/SwitchButton;->O:F

    neg-float v1, v1

    invoke-virtual {p1, v7, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 30
    iget v1, p0, Lnet/nyx/widget/view/SwitchButton;->H:F

    const/high16 v2, 0x40000000    # 2.0f

    div-float v3, v1, v2

    div-float/2addr v1, v2

    const v2, 0x3f7ae148    # 0.98f

    invoke-virtual {p1, v2, v2, v3, v1}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 31
    iget-object v1, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 32
    iget-object v1, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    invoke-virtual {v1, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 33
    iget-object v1, p0, Lnet/nyx/widget/view/SwitchButton;->k:Landroid/graphics/Path;

    iget-object v2, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 34
    iget-object v1, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 35
    iget-object v1, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    iget v2, p0, Lnet/nyx/widget/view/SwitchButton;->G:F

    const/high16 v3, 0x3f000000    # 0.5f

    mul-float v2, v2, v3

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 36
    iget-object v1, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    if-eqz v0, :cond_11e

    iget v0, p0, Lnet/nyx/widget/view/SwitchButton;->v:I

    goto :goto_120

    :cond_11e
    iget v0, p0, Lnet/nyx/widget/view/SwitchButton;->x:I

    :goto_120
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 37
    iget-object v0, p0, Lnet/nyx/widget/view/SwitchButton;->k:Landroid/graphics/Path;

    iget-object v1, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 38
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 39
    iget-object p1, p0, Lnet/nyx/widget/view/SwitchButton;->i:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/graphics/Paint;->reset()V

    .line 40
    iget p1, p0, Lnet/nyx/widget/view/SwitchButton;->m:F

    cmpl-float p1, p1, v7

    if-gtz p1, :cond_13e

    iget p1, p0, Lnet/nyx/widget/view/SwitchButton;->n:F

    cmpl-float p1, p1, v7

    if-lez p1, :cond_141

    .line 41
    :cond_13e
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_141
    return-void
.end method

.method public onMeasure(II)V
    .registers 6

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    const/high16 v2, -0x80000000

    if-eq v0, v2, :cond_d

    if-eqz v0, :cond_d

    goto :goto_28

    .line 2
    :cond_d
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Ld/a/d/c;->dp_56:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr p1, v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr p1, v0

    float-to-int p1, p1

    invoke-static {p1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 3
    :goto_28
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    if-eq v0, v2, :cond_31

    if-eqz v0, :cond_31

    goto :goto_4a

    .line 4
    :cond_31
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    int-to-float p2, p2

    const v0, 0x3f2e147b    # 0.68f

    mul-float p2, p2, v0

    float-to-int p2, p2

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    add-int/2addr p2, v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    add-int/2addr p2, v0

    .line 6
    invoke-static {p2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 7
    :goto_4a
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 3

    .line 1
    check-cast p1, Lnet/nyx/widget/view/SwitchButton$SavedState;

    .line 2
    invoke-virtual {p1}, Landroid/view/View$BaseSavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 3
    invoke-static {p1}, Lnet/nyx/widget/view/SwitchButton$SavedState;->a(Lnet/nyx/widget/view/SwitchButton$SavedState;)Z

    move-result p1

    iput-boolean p1, p0, Lnet/nyx/widget/view/SwitchButton;->t:Z

    if-eqz p1, :cond_13

    const/4 p1, 0x3

    goto :goto_14

    :cond_13
    const/4 p1, 0x1

    .line 4
    :goto_14
    iput p1, p0, Lnet/nyx/widget/view/SwitchButton;->q:I

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 2
    new-instance v1, Lnet/nyx/widget/view/SwitchButton$SavedState;

    invoke-direct {v1, v0}, Lnet/nyx/widget/view/SwitchButton$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 3
    iget-boolean v0, p0, Lnet/nyx/widget/view/SwitchButton;->t:Z

    invoke-static {v1, v0}, Lnet/nyx/widget/view/SwitchButton$SavedState;->a(Lnet/nyx/widget/view/SwitchButton$SavedState;Z)Z

    return-object v1
.end method

.method public onSizeChanged(IIII)V
    .registers 15

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result p4

    add-int/2addr p3, p4

    if-le p1, p3, :cond_18

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result p4

    add-int/2addr p3, p4

    if-le p2, p3, :cond_18

    const/4 p3, 0x1

    goto :goto_19

    :cond_18
    const/4 p3, 0x0

    :goto_19
    iput-boolean p3, p0, Lnet/nyx/widget/view/SwitchButton;->r:Z

    if-eqz p3, :cond_13b

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p3

    sub-int p3, p1, p3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result p4

    sub-int/2addr p3, p4

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p4

    sub-int/2addr p2, p4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result p4

    sub-int/2addr p2, p4

    int-to-float p3, p3

    const p4, 0x3f2e147b    # 0.68f

    mul-float v0, p3, p4

    int-to-float p2, p2

    cmpg-float v1, v0, p2

    if-gez v1, :cond_5a

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p3

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result p4

    sub-int/2addr p1, p4

    sub-float/2addr p2, v0

    float-to-int p2, p2

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p4

    div-int/lit8 p2, p2, 0x2

    add-int/2addr p4, p2

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    sub-int/2addr v0, p2

    goto :goto_7e

    :cond_5a
    div-float/2addr p2, p4

    sub-float/2addr p3, p2

    float-to-int p1, p3

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p2

    div-int/lit8 p1, p1, 0x2

    add-int p3, p2, p1

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result p4

    sub-int/2addr p2, p4

    sub-int p1, p2, p1

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p4

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    sub-int v0, p2, v0

    :goto_7e
    sub-int p2, v0, p4

    int-to-float p2, p2

    const v1, 0x3d8f5c29    # 0.07f

    mul-float p2, p2, v1

    float-to-int p2, p2

    int-to-float p2, p2

    .line 12
    iput p2, p0, Lnet/nyx/widget/view/SwitchButton;->O:F

    int-to-float p3, p3

    int-to-float p4, p4

    add-float/2addr p4, p2

    int-to-float p1, p1

    .line 13
    iput p1, p0, Lnet/nyx/widget/view/SwitchButton;->A:F

    int-to-float v0, v0

    sub-float/2addr v0, p2

    sub-float p2, v0, p4

    add-float v1, p1, p3

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    .line 14
    iput v1, p0, Lnet/nyx/widget/view/SwitchButton;->B:F

    add-float v1, v0, p4

    div-float v5, v1, v2

    .line 15
    iput v5, p0, Lnet/nyx/widget/view/SwitchButton;->C:F

    .line 16
    iput p3, p0, Lnet/nyx/widget/view/SwitchButton;->I:F

    .line 17
    iput p2, p0, Lnet/nyx/widget/view/SwitchButton;->H:F

    add-float v1, p3, p2

    .line 18
    iput v1, p0, Lnet/nyx/widget/view/SwitchButton;->J:F

    div-float v1, p2, v2

    const v3, 0x3f733333    # 0.95f

    mul-float v3, v3, v1

    .line 19
    iput v3, p0, Lnet/nyx/widget/view/SwitchButton;->F:F

    const v4, 0x3e4ccccd    # 0.2f

    mul-float v4, v4, v3

    .line 20
    iput v4, p0, Lnet/nyx/widget/view/SwitchButton;->E:F

    sub-float/2addr v1, v3

    mul-float v1, v1, v2

    .line 21
    iput v1, p0, Lnet/nyx/widget/view/SwitchButton;->G:F

    sub-float/2addr p1, p2

    .line 22
    iput p1, p0, Lnet/nyx/widget/view/SwitchButton;->K:F

    sub-float/2addr p1, v4

    .line 23
    iput p1, p0, Lnet/nyx/widget/view/SwitchButton;->L:F

    .line 24
    iput p3, p0, Lnet/nyx/widget/view/SwitchButton;->N:F

    add-float/2addr v4, p3

    .line 25
    iput v4, p0, Lnet/nyx/widget/view/SwitchButton;->M:F

    const/high16 p1, 0x3f800000    # 1.0f

    div-float/2addr v1, p2

    sub-float/2addr p1, v1

    .line 26
    iput p1, p0, Lnet/nyx/widget/view/SwitchButton;->D:F

    .line 27
    iget-object p1, p0, Lnet/nyx/widget/view/SwitchButton;->j:Landroid/graphics/Path;

    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 28
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 29
    iput p4, p1, Landroid/graphics/RectF;->top:F

    .line 30
    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    .line 31
    iput p3, p1, Landroid/graphics/RectF;->left:F

    add-float/2addr p3, p2

    .line 32
    iput p3, p1, Landroid/graphics/RectF;->right:F

    .line 33
    iget-object p3, p0, Lnet/nyx/widget/view/SwitchButton;->j:Landroid/graphics/Path;

    const/high16 v1, 0x42b40000    # 90.0f

    const/high16 v3, 0x43340000    # 180.0f

    invoke-virtual {p3, p1, v1, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 34
    iget p3, p0, Lnet/nyx/widget/view/SwitchButton;->A:F

    sub-float p2, p3, p2

    iput p2, p1, Landroid/graphics/RectF;->left:F

    .line 35
    iput p3, p1, Landroid/graphics/RectF;->right:F

    .line 36
    iget-object p2, p0, Lnet/nyx/widget/view/SwitchButton;->j:Landroid/graphics/Path;

    const/high16 p3, 0x43870000    # 270.0f

    invoke-virtual {p2, p1, p3, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 37
    iget-object p1, p0, Lnet/nyx/widget/view/SwitchButton;->j:Landroid/graphics/Path;

    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    .line 38
    iget-object p1, p0, Lnet/nyx/widget/view/SwitchButton;->l:Landroid/graphics/RectF;

    iget p2, p0, Lnet/nyx/widget/view/SwitchButton;->I:F

    iput p2, p1, Landroid/graphics/RectF;->left:F

    .line 39
    iget p3, p0, Lnet/nyx/widget/view/SwitchButton;->J:F

    iput p3, p1, Landroid/graphics/RectF;->right:F

    .line 40
    iget v1, p0, Lnet/nyx/widget/view/SwitchButton;->G:F

    div-float v3, v1, v2

    add-float/2addr p4, v3

    iput p4, p1, Landroid/graphics/RectF;->top:F

    div-float/2addr v1, v2

    sub-float/2addr v0, v1

    .line 41
    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    add-float/2addr p3, p2

    div-float v4, p3, v2

    .line 42
    iget p1, p0, Lnet/nyx/widget/view/SwitchButton;->y:I

    shr-int/lit8 p2, p1, 0x10

    and-int/lit16 p2, p2, 0xff

    shr-int/lit8 p3, p1, 0x8

    and-int/lit16 p3, p3, 0xff

    and-int/lit16 p1, p1, 0xff

    .line 43
    new-instance p4, Landroid/graphics/RadialGradient;

    iget v6, p0, Lnet/nyx/widget/view/SwitchButton;->F:F

    const/16 v0, 0xc8

    invoke-static {v0, p2, p3, p1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v7

    const/16 v0, 0x19

    .line 44
    invoke-static {v0, p2, p3, p1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v8

    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move-object v3, p4

    invoke-direct/range {v3 .. v9}, Landroid/graphics/RadialGradient;-><init>(FFFIILandroid/graphics/Shader$TileMode;)V

    iput-object p4, p0, Lnet/nyx/widget/view/SwitchButton;->o:Landroid/graphics/RadialGradient;

    :cond_13b
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_46

    iget v0, p0, Lnet/nyx/widget/view/SwitchButton;->q:I

    const/4 v2, 0x3

    if-eq v0, v2, :cond_11

    if-ne v0, v1, :cond_46

    :cond_11
    iget v0, p0, Lnet/nyx/widget/view/SwitchButton;->m:F

    iget v3, p0, Lnet/nyx/widget/view/SwitchButton;->n:F

    mul-float v0, v0, v3

    const/4 v3, 0x0

    cmpl-float v0, v0, v3

    if-nez v0, :cond_46

    .line 3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-eq p1, v1, :cond_23

    goto :goto_46

    .line 4
    :cond_23
    iget p1, p0, Lnet/nyx/widget/view/SwitchButton;->q:I

    iput p1, p0, Lnet/nyx/widget/view/SwitchButton;->p:I

    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    iput v0, p0, Lnet/nyx/widget/view/SwitchButton;->n:F

    const/4 v0, 0x0

    if-eq p1, v1, :cond_3c

    if-eq p1, v2, :cond_31

    goto :goto_46

    .line 6
    :cond_31
    invoke-virtual {p0, v0, v0}, Lnet/nyx/widget/view/SwitchButton;->a(ZZ)V

    .line 7
    iget-object p1, p0, Lnet/nyx/widget/view/SwitchButton;->z:Lnet/nyx/widget/view/SwitchButton$b;

    if-eqz p1, :cond_46

    .line 8
    invoke-interface {p1, p0, v0}, Lnet/nyx/widget/view/SwitchButton$b;->a(Lnet/nyx/widget/view/SwitchButton;Z)V

    goto :goto_46

    .line 9
    :cond_3c
    invoke-virtual {p0, v1, v0}, Lnet/nyx/widget/view/SwitchButton;->a(ZZ)V

    .line 10
    iget-object p1, p0, Lnet/nyx/widget/view/SwitchButton;->z:Lnet/nyx/widget/view/SwitchButton$b;

    if-eqz p1, :cond_46

    .line 11
    invoke-interface {p1, p0, v1}, Lnet/nyx/widget/view/SwitchButton$b;->a(Lnet/nyx/widget/view/SwitchButton;Z)V

    :cond_46
    :goto_46
    return v1
.end method

.method public setChecked(Z)V
    .registers 3

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, p1, v0}, Lnet/nyx/widget/view/SwitchButton;->a(ZZ)V

    return-void
.end method

.method public setOnCheckedChangeListener(Lnet/nyx/widget/view/SwitchButton$b;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lnet/nyx/widget/view/SwitchButton;->z:Lnet/nyx/widget/view/SwitchButton$b;

    return-void
.end method

.method public setShadow(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lnet/nyx/widget/view/SwitchButton;->s:Z

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
