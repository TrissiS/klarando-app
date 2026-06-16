.class public Lb/j/a/c;
.super Ljava/lang/Object;
.source "ViewDragHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/j/a/c$c;
    }
.end annotation


# static fields
.field public static final w:Landroid/view/animation/Interpolator;


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:[F

.field public e:[F

.field public f:[F

.field public g:[F

.field public h:[I

.field public i:[I

.field public j:[I

.field public k:I

.field public l:Landroid/view/VelocityTracker;

.field public m:F

.field public n:F

.field public o:I

.field public p:I

.field public q:Landroid/widget/OverScroller;

.field public final r:Lb/j/a/c$c;

.field public s:Landroid/view/View;

.field public t:Z

.field public final u:Landroid/view/ViewGroup;

.field public final v:Ljava/lang/Runnable;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Lb/j/a/c$a;

    invoke-direct {v0}, Lb/j/a/c$a;-><init>()V

    sput-object v0, Lb/j/a/c;->w:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;Lb/j/a/c$c;)V
    .registers 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lb/j/a/c;->c:I

    .line 3
    new-instance v0, Lb/j/a/c$b;

    invoke-direct {v0, p0}, Lb/j/a/c$b;-><init>(Lb/j/a/c;)V

    iput-object v0, p0, Lb/j/a/c;->v:Ljava/lang/Runnable;

    if-eqz p2, :cond_53

    if-eqz p3, :cond_4b

    .line 4
    iput-object p2, p0, Lb/j/a/c;->u:Landroid/view/ViewGroup;

    .line 5
    iput-object p3, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    .line 6
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p2

    .line 7
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p3

    iget p3, p3, Landroid/util/DisplayMetrics;->density:F

    const/high16 v0, 0x41a00000    # 20.0f

    mul-float p3, p3, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p3, v0

    float-to-int p3, p3

    .line 8
    iput p3, p0, Lb/j/a/c;->o:I

    .line 9
    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p3

    iput p3, p0, Lb/j/a/c;->b:I

    .line 10
    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result p3

    int-to-float p3, p3

    iput p3, p0, Lb/j/a/c;->m:F

    .line 11
    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Lb/j/a/c;->n:F

    .line 12
    new-instance p2, Landroid/widget/OverScroller;

    sget-object p3, Lb/j/a/c;->w:Landroid/view/animation/Interpolator;

    invoke-direct {p2, p1, p3}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object p2, p0, Lb/j/a/c;->q:Landroid/widget/OverScroller;

    return-void

    .line 13
    :cond_4b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Callback may not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 14
    :cond_53
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Parent view may not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static a(Landroid/view/ViewGroup;FLb/j/a/c$c;)Lb/j/a/c;
    .registers 4

    .line 2
    invoke-static {p0, p2}, Lb/j/a/c;->a(Landroid/view/ViewGroup;Lb/j/a/c$c;)Lb/j/a/c;

    move-result-object p0

    .line 3
    iget p2, p0, Lb/j/a/c;->b:I

    int-to-float p2, p2

    const/high16 v0, 0x3f800000    # 1.0f

    div-float/2addr v0, p1

    mul-float p2, p2, v0

    float-to-int p1, p2

    iput p1, p0, Lb/j/a/c;->b:I

    return-object p0
.end method

.method public static a(Landroid/view/ViewGroup;Lb/j/a/c$c;)Lb/j/a/c;
    .registers 4

    .line 1
    new-instance v0, Lb/j/a/c;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p0, p1}, Lb/j/a/c;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;Lb/j/a/c$c;)V

    return-object v0
.end method


# virtual methods
.method public final a(F)F
    .registers 4

    const/high16 v0, 0x3f000000    # 0.5f

    sub-float/2addr p1, v0

    const v0, 0x3ef1463b

    mul-float p1, p1, v0

    float-to-double v0, p1

    .line 25
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float p1, v0

    return p1
.end method

.method public final a(FFF)F
    .registers 6

    .line 24
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/4 v1, 0x0

    cmpg-float p2, v0, p2

    if-gez p2, :cond_a

    return v1

    :cond_a
    cmpl-float p2, v0, p3

    if-lez p2, :cond_15

    cmpl-float p1, p1, v1

    if-lez p1, :cond_13

    goto :goto_14

    :cond_13
    neg-float p3, p3

    :goto_14
    return p3

    :cond_15
    return p1
.end method

.method public final a(III)I
    .registers 5

    .line 23
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    if-ge v0, p2, :cond_8

    const/4 p1, 0x0

    return p1

    :cond_8
    if-le v0, p3, :cond_f

    if-lez p1, :cond_d

    goto :goto_e

    :cond_d
    neg-int p3, p3

    :goto_e
    return p3

    :cond_f
    return p1
.end method

.method public final a(Landroid/view/View;IIII)I
    .registers 12

    .line 15
    iget v0, p0, Lb/j/a/c;->n:F

    float-to-int v0, v0

    iget v1, p0, Lb/j/a/c;->m:F

    float-to-int v1, v1

    invoke-virtual {p0, p4, v0, v1}, Lb/j/a/c;->a(III)I

    move-result p4

    .line 16
    iget v0, p0, Lb/j/a/c;->n:F

    float-to-int v0, v0

    iget v1, p0, Lb/j/a/c;->m:F

    float-to-int v1, v1

    invoke-virtual {p0, p5, v0, v1}, Lb/j/a/c;->a(III)I

    move-result p5

    .line 17
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 18
    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result v1

    .line 19
    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    move-result v2

    .line 20
    invoke-static {p5}, Ljava/lang/Math;->abs(I)I

    move-result v3

    add-int v4, v2, v3

    add-int v5, v0, v1

    if-eqz p4, :cond_2d

    int-to-float v0, v2

    int-to-float v2, v4

    goto :goto_2f

    :cond_2d
    int-to-float v0, v0

    int-to-float v2, v5

    :goto_2f
    div-float/2addr v0, v2

    if-eqz p5, :cond_35

    int-to-float v1, v3

    int-to-float v2, v4

    goto :goto_37

    :cond_35
    int-to-float v1, v1

    int-to-float v2, v5

    :goto_37
    div-float/2addr v1, v2

    .line 21
    iget-object v2, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    invoke-virtual {v2, p1}, Lb/j/a/c$c;->a(Landroid/view/View;)I

    move-result v2

    invoke-virtual {p0, p2, p4, v2}, Lb/j/a/c;->b(III)I

    move-result p2

    .line 22
    iget-object p4, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    invoke-virtual {p4, p1}, Lb/j/a/c$c;->b(Landroid/view/View;)I

    move-result p1

    invoke-virtual {p0, p3, p5, p1}, Lb/j/a/c;->b(III)I

    move-result p1

    int-to-float p2, p2

    mul-float p2, p2, v0

    int-to-float p1, p1

    mul-float p1, p1, v1

    add-float/2addr p2, p1

    float-to-int p1, p2

    return p1
.end method

.method public a()V
    .registers 2

    const/4 v0, -0x1

    .line 10
    iput v0, p0, Lb/j/a/c;->c:I

    .line 11
    invoke-virtual {p0}, Lb/j/a/c;->b()V

    .line 12
    iget-object v0, p0, Lb/j/a/c;->l:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_10

    .line 13
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lb/j/a/c;->l:Landroid/view/VelocityTracker;

    :cond_10
    return-void
.end method

.method public final a(FF)V
    .registers 6

    const/4 v0, 0x1

    .line 40
    iput-boolean v0, p0, Lb/j/a/c;->t:Z

    .line 41
    iget-object v1, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    iget-object v2, p0, Lb/j/a/c;->s:Landroid/view/View;

    invoke-virtual {v1, v2, p1, p2}, Lb/j/a/c$c;->a(Landroid/view/View;FF)V

    const/4 p1, 0x0

    .line 42
    iput-boolean p1, p0, Lb/j/a/c;->t:Z

    .line 43
    iget p2, p0, Lb/j/a/c;->a:I

    if-ne p2, v0, :cond_14

    .line 44
    invoke-virtual {p0, p1}, Lb/j/a/c;->f(I)V

    :cond_14
    return-void
.end method

.method public final a(FFI)V
    .registers 6

    const/4 v0, 0x1

    .line 112
    invoke-virtual {p0, p1, p2, p3, v0}, Lb/j/a/c;->a(FFII)Z

    move-result v1

    if-eqz v1, :cond_8

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    const/4 v1, 0x4

    .line 113
    invoke-virtual {p0, p2, p1, p3, v1}, Lb/j/a/c;->a(FFII)Z

    move-result v1

    if-eqz v1, :cond_12

    or-int/lit8 v0, v0, 0x4

    :cond_12
    const/4 v1, 0x2

    .line 114
    invoke-virtual {p0, p1, p2, p3, v1}, Lb/j/a/c;->a(FFII)Z

    move-result v1

    if-eqz v1, :cond_1b

    or-int/lit8 v0, v0, 0x2

    :cond_1b
    const/16 v1, 0x8

    .line 115
    invoke-virtual {p0, p2, p1, p3, v1}, Lb/j/a/c;->a(FFII)Z

    move-result p1

    if-eqz p1, :cond_25

    or-int/lit8 v0, v0, 0x8

    :cond_25
    if-eqz v0, :cond_33

    .line 116
    iget-object p1, p0, Lb/j/a/c;->i:[I

    aget p2, p1, p3

    or-int/2addr p2, v0

    aput p2, p1, p3

    .line 117
    iget-object p1, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    invoke-virtual {p1, v0, p3}, Lb/j/a/c$c;->a(II)V

    :cond_33
    return-void
.end method

.method public final a(IIII)V
    .registers 15

    .line 137
    iget-object v0, p0, Lb/j/a/c;->s:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    .line 138
    iget-object v1, p0, Lb/j/a/c;->s:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    if-eqz p3, :cond_1d

    .line 139
    iget-object v2, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    iget-object v3, p0, Lb/j/a/c;->s:Landroid/view/View;

    invoke-virtual {v2, v3, p1, p3}, Lb/j/a/c$c;->a(Landroid/view/View;II)I

    move-result p1

    .line 140
    iget-object v2, p0, Lb/j/a/c;->s:Landroid/view/View;

    sub-int v3, p1, v0

    invoke-static {v2, v3}, Lb/h/m/y;->d(Landroid/view/View;I)V

    :cond_1d
    move v6, p1

    if-eqz p4, :cond_2f

    .line 141
    iget-object p1, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    iget-object v2, p0, Lb/j/a/c;->s:Landroid/view/View;

    invoke-virtual {p1, v2, p2, p4}, Lb/j/a/c$c;->b(Landroid/view/View;II)I

    move-result p2

    .line 142
    iget-object p1, p0, Lb/j/a/c;->s:Landroid/view/View;

    sub-int v2, p2, v1

    invoke-static {p1, v2}, Lb/h/m/y;->e(Landroid/view/View;I)V

    :cond_2f
    move v7, p2

    if-nez p3, :cond_34

    if-eqz p4, :cond_3f

    :cond_34
    sub-int v8, v6, v0

    sub-int v9, v7, v1

    .line 143
    iget-object v4, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    iget-object v5, p0, Lb/j/a/c;->s:Landroid/view/View;

    invoke-virtual/range {v4 .. v9}, Lb/j/a/c$c;->a(Landroid/view/View;IIII)V

    :cond_3f
    return-void
.end method

.method public a(Landroid/view/MotionEvent;)V
    .registers 11

    .line 45
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 46
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v1

    if-nez v0, :cond_d

    .line 47
    invoke-virtual {p0}, Lb/j/a/c;->a()V

    .line 48
    :cond_d
    iget-object v2, p0, Lb/j/a/c;->l:Landroid/view/VelocityTracker;

    if-nez v2, :cond_17

    .line 49
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v2

    iput-object v2, p0, Lb/j/a/c;->l:Landroid/view/VelocityTracker;

    .line 50
    :cond_17
    iget-object v2, p0, Lb/j/a/c;->l:Landroid/view/VelocityTracker;

    invoke-virtual {v2, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    const/4 v2, 0x0

    if-eqz v0, :cond_151

    const/4 v3, 0x1

    if-eq v0, v3, :cond_146

    const/4 v4, 0x2

    if-eq v0, v4, :cond_bf

    const/4 v4, 0x3

    if-eq v0, v4, :cond_b2

    const/4 v4, 0x5

    if-eq v0, v4, :cond_75

    const/4 v4, 0x6

    if-eq v0, v4, :cond_30

    goto/16 :goto_179

    .line 51
    :cond_30
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    .line 52
    iget v1, p0, Lb/j/a/c;->a:I

    if-ne v1, v3, :cond_70

    iget v1, p0, Lb/j/a/c;->c:I

    if-ne v0, v1, :cond_70

    .line 53
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    :goto_40
    const/4 v3, -0x1

    if-ge v2, v1, :cond_6a

    .line 54
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v4

    .line 55
    iget v5, p0, Lb/j/a/c;->c:I

    if-ne v4, v5, :cond_4c

    goto :goto_67

    .line 56
    :cond_4c
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v5

    .line 57
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    float-to-int v5, v5

    float-to-int v6, v6

    .line 58
    invoke-virtual {p0, v5, v6}, Lb/j/a/c;->b(II)Landroid/view/View;

    move-result-object v5

    iget-object v6, p0, Lb/j/a/c;->s:Landroid/view/View;

    if-ne v5, v6, :cond_67

    .line 59
    invoke-virtual {p0, v6, v4}, Lb/j/a/c;->b(Landroid/view/View;I)Z

    move-result v4

    if-eqz v4, :cond_67

    .line 60
    iget p1, p0, Lb/j/a/c;->c:I

    goto :goto_6b

    :cond_67
    :goto_67
    add-int/lit8 v2, v2, 0x1

    goto :goto_40

    :cond_6a
    const/4 p1, -0x1

    :goto_6b
    if-ne p1, v3, :cond_70

    .line 61
    invoke-virtual {p0}, Lb/j/a/c;->g()V

    .line 62
    :cond_70
    invoke-virtual {p0, v0}, Lb/j/a/c;->b(I)V

    goto/16 :goto_179

    .line 63
    :cond_75
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    .line 64
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    .line 65
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    .line 66
    invoke-virtual {p0, v2, p1, v0}, Lb/j/a/c;->b(FFI)V

    .line 67
    iget v1, p0, Lb/j/a/c;->a:I

    if-nez v1, :cond_a3

    float-to-int v1, v2

    float-to-int p1, p1

    .line 68
    invoke-virtual {p0, v1, p1}, Lb/j/a/c;->b(II)Landroid/view/View;

    move-result-object p1

    .line 69
    invoke-virtual {p0, p1, v0}, Lb/j/a/c;->b(Landroid/view/View;I)Z

    .line 70
    iget-object p1, p0, Lb/j/a/c;->h:[I

    aget p1, p1, v0

    .line 71
    iget v1, p0, Lb/j/a/c;->p:I

    and-int v2, p1, v1

    if-eqz v2, :cond_179

    .line 72
    iget-object v2, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    and-int/2addr p1, v1

    invoke-virtual {v2, p1, v0}, Lb/j/a/c$c;->b(II)V

    goto/16 :goto_179

    :cond_a3
    float-to-int v1, v2

    float-to-int p1, p1

    .line 73
    invoke-virtual {p0, v1, p1}, Lb/j/a/c;->d(II)Z

    move-result p1

    if-eqz p1, :cond_179

    .line 74
    iget-object p1, p0, Lb/j/a/c;->s:Landroid/view/View;

    invoke-virtual {p0, p1, v0}, Lb/j/a/c;->b(Landroid/view/View;I)Z

    goto/16 :goto_179

    .line 75
    :cond_b2
    iget p1, p0, Lb/j/a/c;->a:I

    if-ne p1, v3, :cond_ba

    const/4 p1, 0x0

    .line 76
    invoke-virtual {p0, p1, p1}, Lb/j/a/c;->a(FF)V

    .line 77
    :cond_ba
    invoke-virtual {p0}, Lb/j/a/c;->a()V

    goto/16 :goto_179

    .line 78
    :cond_bf
    iget v0, p0, Lb/j/a/c;->a:I

    if-ne v0, v3, :cond_ff

    .line 79
    iget v0, p0, Lb/j/a/c;->c:I

    invoke-virtual {p0, v0}, Lb/j/a/c;->e(I)Z

    move-result v0

    if-nez v0, :cond_cd

    goto/16 :goto_179

    .line 80
    :cond_cd
    iget v0, p0, Lb/j/a/c;->c:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    .line 81
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    .line 82
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    .line 83
    iget-object v2, p0, Lb/j/a/c;->f:[F

    iget v3, p0, Lb/j/a/c;->c:I

    aget v2, v2, v3

    sub-float/2addr v1, v2

    float-to-int v1, v1

    .line 84
    iget-object v2, p0, Lb/j/a/c;->g:[F

    aget v2, v2, v3

    sub-float/2addr v0, v2

    float-to-int v0, v0

    .line 85
    iget-object v2, p0, Lb/j/a/c;->s:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v2

    add-int/2addr v2, v1

    iget-object v3, p0, Lb/j/a/c;->s:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    add-int/2addr v3, v0

    invoke-virtual {p0, v2, v3, v1, v0}, Lb/j/a/c;->a(IIII)V

    .line 86
    invoke-virtual {p0, p1}, Lb/j/a/c;->b(Landroid/view/MotionEvent;)V

    goto/16 :goto_179

    .line 87
    :cond_ff
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    :goto_103
    if-ge v2, v0, :cond_142

    .line 88
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 89
    invoke-virtual {p0, v1}, Lb/j/a/c;->e(I)Z

    move-result v4

    if-nez v4, :cond_110

    goto :goto_13f

    .line 90
    :cond_110
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    .line 91
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v5

    .line 92
    iget-object v6, p0, Lb/j/a/c;->d:[F

    aget v6, v6, v1

    sub-float v6, v4, v6

    .line 93
    iget-object v7, p0, Lb/j/a/c;->e:[F

    aget v7, v7, v1

    sub-float v7, v5, v7

    .line 94
    invoke-virtual {p0, v6, v7, v1}, Lb/j/a/c;->a(FFI)V

    .line 95
    iget v8, p0, Lb/j/a/c;->a:I

    if-ne v8, v3, :cond_12c

    goto :goto_142

    :cond_12c
    float-to-int v4, v4

    float-to-int v5, v5

    .line 96
    invoke-virtual {p0, v4, v5}, Lb/j/a/c;->b(II)Landroid/view/View;

    move-result-object v4

    .line 97
    invoke-virtual {p0, v4, v6, v7}, Lb/j/a/c;->a(Landroid/view/View;FF)Z

    move-result v5

    if-eqz v5, :cond_13f

    .line 98
    invoke-virtual {p0, v4, v1}, Lb/j/a/c;->b(Landroid/view/View;I)Z

    move-result v1

    if-eqz v1, :cond_13f

    goto :goto_142

    :cond_13f
    :goto_13f
    add-int/lit8 v2, v2, 0x1

    goto :goto_103

    .line 99
    :cond_142
    :goto_142
    invoke-virtual {p0, p1}, Lb/j/a/c;->b(Landroid/view/MotionEvent;)V

    goto :goto_179

    .line 100
    :cond_146
    iget p1, p0, Lb/j/a/c;->a:I

    if-ne p1, v3, :cond_14d

    .line 101
    invoke-virtual {p0}, Lb/j/a/c;->g()V

    .line 102
    :cond_14d
    invoke-virtual {p0}, Lb/j/a/c;->a()V

    goto :goto_179

    .line 103
    :cond_151
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 104
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    .line 105
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    float-to-int v2, v0

    float-to-int v3, v1

    .line 106
    invoke-virtual {p0, v2, v3}, Lb/j/a/c;->b(II)Landroid/view/View;

    move-result-object v2

    .line 107
    invoke-virtual {p0, v0, v1, p1}, Lb/j/a/c;->b(FFI)V

    .line 108
    invoke-virtual {p0, v2, p1}, Lb/j/a/c;->b(Landroid/view/View;I)Z

    .line 109
    iget-object v0, p0, Lb/j/a/c;->h:[I

    aget v0, v0, p1

    .line 110
    iget v1, p0, Lb/j/a/c;->p:I

    and-int v2, v0, v1

    if-eqz v2, :cond_179

    .line 111
    iget-object v2, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    and-int/2addr v0, v1

    invoke-virtual {v2, v0, p1}, Lb/j/a/c$c;->b(II)V

    :cond_179
    :goto_179
    return-void
.end method

.method public a(Landroid/view/View;I)V
    .registers 5

    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Lb/j/a/c;->u:Landroid/view/ViewGroup;

    if-ne v0, v1, :cond_16

    .line 5
    iput-object p1, p0, Lb/j/a/c;->s:Landroid/view/View;

    .line 6
    iput p2, p0, Lb/j/a/c;->c:I

    .line 7
    iget-object v0, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    invoke-virtual {v0, p1, p2}, Lb/j/a/c$c;->a(Landroid/view/View;I)V

    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p1}, Lb/j/a/c;->f(I)V

    return-void

    .line 9
    :cond_16
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "captureChildView: parameter must be a descendant of the ViewDragHelper\'s tracked parent view ("

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lb/j/a/c;->u:Landroid/view/ViewGroup;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final a(FFII)Z
    .registers 8

    .line 118
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    .line 119
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    .line 120
    iget-object v0, p0, Lb/j/a/c;->h:[I

    aget v0, v0, p3

    and-int/2addr v0, p4

    const/4 v1, 0x0

    if-ne v0, p4, :cond_57

    iget v0, p0, Lb/j/a/c;->p:I

    and-int/2addr v0, p4

    if-eqz v0, :cond_57

    iget-object v0, p0, Lb/j/a/c;->j:[I

    aget v0, v0, p3

    and-int/2addr v0, p4

    if-eq v0, p4, :cond_57

    iget-object v0, p0, Lb/j/a/c;->i:[I

    aget v0, v0, p3

    and-int/2addr v0, p4

    if-eq v0, p4, :cond_57

    iget v0, p0, Lb/j/a/c;->b:I

    int-to-float v2, v0

    cmpg-float v2, p1, v2

    if-gtz v2, :cond_30

    int-to-float v0, v0

    cmpg-float v0, p2, v0

    if-gtz v0, :cond_30

    goto :goto_57

    :cond_30
    const/high16 v0, 0x3f000000    # 0.5f

    mul-float p2, p2, v0

    cmpg-float p2, p1, p2

    if-gez p2, :cond_48

    .line 121
    iget-object p2, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    invoke-virtual {p2, p4}, Lb/j/a/c$c;->b(I)Z

    move-result p2

    if-eqz p2, :cond_48

    .line 122
    iget-object p1, p0, Lb/j/a/c;->j:[I

    aget p2, p1, p3

    or-int/2addr p2, p4

    aput p2, p1, p3

    return v1

    .line 123
    :cond_48
    iget-object p2, p0, Lb/j/a/c;->i:[I

    aget p2, p2, p3

    and-int/2addr p2, p4

    if-nez p2, :cond_57

    iget p2, p0, Lb/j/a/c;->b:I

    int-to-float p2, p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_57

    const/4 v1, 0x1

    :cond_57
    :goto_57
    return v1
.end method

.method public a(I)Z
    .registers 6

    .line 129
    iget-object v0, p0, Lb/j/a/c;->d:[F

    array-length v0, v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_5
    if-ge v2, v0, :cond_12

    .line 130
    invoke-virtual {p0, p1, v2}, Lb/j/a/c;->a(II)Z

    move-result v3

    if-eqz v3, :cond_f

    const/4 p1, 0x1

    return p1

    :cond_f
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_12
    return v1
.end method

.method public a(II)Z
    .registers 9

    .line 131
    invoke-virtual {p0, p2}, Lb/j/a/c;->d(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    :cond_8
    and-int/lit8 v0, p1, 0x1

    const/4 v2, 0x1

    if-ne v0, v2, :cond_f

    const/4 v0, 0x1

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    :goto_10
    const/4 v3, 0x2

    and-int/2addr p1, v3

    if-ne p1, v3, :cond_16

    const/4 p1, 0x1

    goto :goto_17

    :cond_16
    const/4 p1, 0x0

    .line 132
    :goto_17
    iget-object v3, p0, Lb/j/a/c;->f:[F

    aget v3, v3, p2

    iget-object v4, p0, Lb/j/a/c;->d:[F

    aget v4, v4, p2

    sub-float/2addr v3, v4

    .line 133
    iget-object v4, p0, Lb/j/a/c;->g:[F

    aget v4, v4, p2

    iget-object v5, p0, Lb/j/a/c;->e:[F

    aget p2, v5, p2

    sub-float/2addr v4, p2

    if-eqz v0, :cond_3d

    if-eqz p1, :cond_3d

    mul-float v3, v3, v3

    mul-float v4, v4, v4

    add-float/2addr v3, v4

    .line 134
    iget p1, p0, Lb/j/a/c;->b:I

    mul-int p1, p1, p1

    int-to-float p1, p1

    cmpl-float p1, v3, p1

    if-lez p1, :cond_3c

    const/4 v1, 0x1

    :cond_3c
    return v1

    :cond_3d
    if-eqz v0, :cond_4c

    .line 135
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget p2, p0, Lb/j/a/c;->b:I

    int-to-float p2, p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_4b

    const/4 v1, 0x1

    :cond_4b
    return v1

    :cond_4c
    if-eqz p1, :cond_5a

    .line 136
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget p2, p0, Lb/j/a/c;->b:I

    int-to-float p2, p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_5a

    const/4 v1, 0x1

    :cond_5a
    return v1
.end method

.method public final a(Landroid/view/View;FF)Z
    .registers 8

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    .line 124
    :cond_4
    iget-object v1, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    invoke-virtual {v1, p1}, Lb/j/a/c$c;->a(Landroid/view/View;)I

    move-result v1

    const/4 v2, 0x1

    if-lez v1, :cond_f

    const/4 v1, 0x1

    goto :goto_10

    :cond_f
    const/4 v1, 0x0

    .line 125
    :goto_10
    iget-object v3, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    invoke-virtual {v3, p1}, Lb/j/a/c$c;->b(Landroid/view/View;)I

    move-result p1

    if-lez p1, :cond_1a

    const/4 p1, 0x1

    goto :goto_1b

    :cond_1a
    const/4 p1, 0x0

    :goto_1b
    if-eqz v1, :cond_2f

    if-eqz p1, :cond_2f

    mul-float p2, p2, p2

    mul-float p3, p3, p3

    add-float/2addr p2, p3

    .line 126
    iget p1, p0, Lb/j/a/c;->b:I

    mul-int p1, p1, p1

    int-to-float p1, p1

    cmpl-float p1, p2, p1

    if-lez p1, :cond_2e

    const/4 v0, 0x1

    :cond_2e
    return v0

    :cond_2f
    if-eqz v1, :cond_3e

    .line 127
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget p2, p0, Lb/j/a/c;->b:I

    int-to-float p2, p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_3d

    const/4 v0, 0x1

    :cond_3d
    return v0

    :cond_3e
    if-eqz p1, :cond_4c

    .line 128
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget p2, p0, Lb/j/a/c;->b:I

    int-to-float p2, p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_4c

    const/4 v0, 0x1

    :cond_4c
    return v0
.end method

.method public a(Landroid/view/View;II)Z
    .registers 6

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    .line 144
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    if-lt p2, v1, :cond_1d

    .line 145
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v1

    if-ge p2, v1, :cond_1d

    .line 146
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p2

    if-lt p3, p2, :cond_1d

    .line 147
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result p1

    if-ge p3, p1, :cond_1d

    const/4 v0, 0x1

    :cond_1d
    return v0
.end method

.method public a(Z)Z
    .registers 13

    .line 26
    iget v0, p0, Lb/j/a/c;->a:I

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-ne v0, v1, :cond_6a

    .line 27
    iget-object v0, p0, Lb/j/a/c;->q:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    move-result v0

    .line 28
    iget-object v3, p0, Lb/j/a/c;->q:Landroid/widget/OverScroller;

    invoke-virtual {v3}, Landroid/widget/OverScroller;->getCurrX()I

    move-result v3

    .line 29
    iget-object v4, p0, Lb/j/a/c;->q:Landroid/widget/OverScroller;

    invoke-virtual {v4}, Landroid/widget/OverScroller;->getCurrY()I

    move-result v10

    .line 30
    iget-object v4, p0, Lb/j/a/c;->s:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v4

    sub-int v8, v3, v4

    .line 31
    iget-object v4, p0, Lb/j/a/c;->s:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v4

    sub-int v9, v10, v4

    if-eqz v8, :cond_2f

    .line 32
    iget-object v4, p0, Lb/j/a/c;->s:Landroid/view/View;

    invoke-static {v4, v8}, Lb/h/m/y;->d(Landroid/view/View;I)V

    :cond_2f
    if-eqz v9, :cond_36

    .line 33
    iget-object v4, p0, Lb/j/a/c;->s:Landroid/view/View;

    invoke-static {v4, v9}, Lb/h/m/y;->e(Landroid/view/View;I)V

    :cond_36
    if-nez v8, :cond_3a

    if-eqz v9, :cond_43

    .line 34
    :cond_3a
    iget-object v4, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    iget-object v5, p0, Lb/j/a/c;->s:Landroid/view/View;

    move v6, v3

    move v7, v10

    invoke-virtual/range {v4 .. v9}, Lb/j/a/c$c;->a(Landroid/view/View;IIII)V

    :cond_43
    if-eqz v0, :cond_5b

    .line 35
    iget-object v4, p0, Lb/j/a/c;->q:Landroid/widget/OverScroller;

    invoke-virtual {v4}, Landroid/widget/OverScroller;->getFinalX()I

    move-result v4

    if-ne v3, v4, :cond_5b

    iget-object v3, p0, Lb/j/a/c;->q:Landroid/widget/OverScroller;

    invoke-virtual {v3}, Landroid/widget/OverScroller;->getFinalY()I

    move-result v3

    if-ne v10, v3, :cond_5b

    .line 36
    iget-object v0, p0, Lb/j/a/c;->q:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->abortAnimation()V

    const/4 v0, 0x0

    :cond_5b
    if-nez v0, :cond_6a

    if-eqz p1, :cond_67

    .line 37
    iget-object p1, p0, Lb/j/a/c;->u:Landroid/view/ViewGroup;

    iget-object v0, p0, Lb/j/a/c;->v:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    goto :goto_6a

    .line 38
    :cond_67
    invoke-virtual {p0, v2}, Lb/j/a/c;->f(I)V

    .line 39
    :cond_6a
    :goto_6a
    iget p1, p0, Lb/j/a/c;->a:I

    if-ne p1, v1, :cond_6f

    const/4 v2, 0x1

    :cond_6f
    return v2
.end method

.method public final b(III)I
    .registers 7

    if-nez p1, :cond_4

    const/4 p1, 0x0

    return p1

    .line 14
    :cond_4
    iget-object v0, p0, Lb/j/a/c;->u:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v0

    .line 15
    div-int/lit8 v1, v0, 0x2

    .line 16
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v2

    int-to-float v2, v2

    int-to-float v0, v0

    div-float/2addr v2, v0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    int-to-float v1, v1

    .line 17
    invoke-virtual {p0, v2}, Lb/j/a/c;->a(F)F

    move-result v2

    mul-float v2, v2, v1

    add-float/2addr v1, v2

    .line 18
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    if-lez p2, :cond_38

    const/high16 p1, 0x447a0000    # 1000.0f

    int-to-float p2, p2

    div-float/2addr v1, p2

    .line 19
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result p2

    mul-float p2, p2, p1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p1

    mul-int/lit8 p1, p1, 0x4

    goto :goto_45

    .line 20
    :cond_38
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    int-to-float p1, p1

    int-to-float p2, p3

    div-float/2addr p1, p2

    add-float/2addr p1, v0

    const/high16 p2, 0x43800000    # 256.0f

    mul-float p1, p1, p2

    float-to-int p1, p1

    :goto_45
    const/16 p2, 0x258

    .line 21
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    return p1
.end method

.method public b(II)Landroid/view/View;
    .registers 6

    .line 56
    iget-object v0, p0, Lb/j/a/c;->u:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_8
    if-ltz v0, :cond_31

    .line 57
    iget-object v1, p0, Lb/j/a/c;->u:Landroid/view/ViewGroup;

    iget-object v2, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    invoke-virtual {v2, v0}, Lb/j/a/c$c;->a(I)I

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 58
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v2

    if-lt p1, v2, :cond_2e

    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v2

    if-ge p1, v2, :cond_2e

    .line 59
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v2

    if-lt p2, v2, :cond_2e

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v2

    if-ge p2, v2, :cond_2e

    return-object v1

    :cond_2e
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    :cond_31
    const/4 p1, 0x0

    return-object p1
.end method

.method public final b()V
    .registers 3

    .line 22
    iget-object v0, p0, Lb/j/a/c;->d:[F

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v1, 0x0

    .line 23
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    .line 24
    iget-object v0, p0, Lb/j/a/c;->e:[F

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    .line 25
    iget-object v0, p0, Lb/j/a/c;->f:[F

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    .line 26
    iget-object v0, p0, Lb/j/a/c;->g:[F

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    .line 27
    iget-object v0, p0, Lb/j/a/c;->h:[I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 28
    iget-object v0, p0, Lb/j/a/c;->i:[I

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 29
    iget-object v0, p0, Lb/j/a/c;->j:[I

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    .line 30
    iput v1, p0, Lb/j/a/c;->k:I

    return-void
.end method

.method public b(F)V
    .registers 2

    .line 1
    iput p1, p0, Lb/j/a/c;->n:F

    return-void
.end method

.method public final b(FFI)V
    .registers 6

    .line 40
    invoke-virtual {p0, p3}, Lb/j/a/c;->c(I)V

    .line 41
    iget-object v0, p0, Lb/j/a/c;->d:[F

    iget-object v1, p0, Lb/j/a/c;->f:[F

    aput p1, v1, p3

    aput p1, v0, p3

    .line 42
    iget-object v0, p0, Lb/j/a/c;->e:[F

    iget-object v1, p0, Lb/j/a/c;->g:[F

    aput p2, v1, p3

    aput p2, v0, p3

    .line 43
    iget-object v0, p0, Lb/j/a/c;->h:[I

    float-to-int p1, p1

    float-to-int p2, p2

    invoke-virtual {p0, p1, p2}, Lb/j/a/c;->c(II)I

    move-result p1

    aput p1, v0, p3

    .line 44
    iget p1, p0, Lb/j/a/c;->k:I

    const/4 p2, 0x1

    shl-int/2addr p2, p3

    or-int/2addr p1, p2

    iput p1, p0, Lb/j/a/c;->k:I

    return-void
.end method

.method public final b(I)V
    .registers 4

    .line 31
    iget-object v0, p0, Lb/j/a/c;->d:[F

    if-eqz v0, :cond_32

    invoke-virtual {p0, p1}, Lb/j/a/c;->d(I)Z

    move-result v0

    if-nez v0, :cond_b

    goto :goto_32

    .line 32
    :cond_b
    iget-object v0, p0, Lb/j/a/c;->d:[F

    const/4 v1, 0x0

    aput v1, v0, p1

    .line 33
    iget-object v0, p0, Lb/j/a/c;->e:[F

    aput v1, v0, p1

    .line 34
    iget-object v0, p0, Lb/j/a/c;->f:[F

    aput v1, v0, p1

    .line 35
    iget-object v0, p0, Lb/j/a/c;->g:[F

    aput v1, v0, p1

    .line 36
    iget-object v0, p0, Lb/j/a/c;->h:[I

    const/4 v1, 0x0

    aput v1, v0, p1

    .line 37
    iget-object v0, p0, Lb/j/a/c;->i:[I

    aput v1, v0, p1

    .line 38
    iget-object v0, p0, Lb/j/a/c;->j:[I

    aput v1, v0, p1

    .line 39
    iget v0, p0, Lb/j/a/c;->k:I

    const/4 v1, 0x1

    shl-int p1, v1, p1

    not-int p1, p1

    and-int/2addr p1, v0

    iput p1, p0, Lb/j/a/c;->k:I

    :cond_32
    :goto_32
    return-void
.end method

.method public final b(Landroid/view/MotionEvent;)V
    .registers 8

    .line 45
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_25

    .line 46
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    .line 47
    invoke-virtual {p0, v2}, Lb/j/a/c;->e(I)Z

    move-result v3

    if-nez v3, :cond_12

    goto :goto_22

    .line 48
    :cond_12
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    .line 49
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v4

    .line 50
    iget-object v5, p0, Lb/j/a/c;->f:[F

    aput v3, v5, v2

    .line 51
    iget-object v3, p0, Lb/j/a/c;->g:[F

    aput v4, v3, v2

    :goto_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_25
    return-void
.end method

.method public final b(IIII)Z
    .registers 15

    .line 7
    iget-object v0, p0, Lb/j/a/c;->s:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v2

    .line 8
    iget-object v0, p0, Lb/j/a/c;->s:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v3

    sub-int/2addr p1, v2

    sub-int/2addr p2, v3

    if-nez p1, :cond_1c

    if-nez p2, :cond_1c

    .line 9
    iget-object p1, p0, Lb/j/a/c;->q:Landroid/widget/OverScroller;

    invoke-virtual {p1}, Landroid/widget/OverScroller;->abortAnimation()V

    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Lb/j/a/c;->f(I)V

    return p1

    .line 11
    :cond_1c
    iget-object v5, p0, Lb/j/a/c;->s:Landroid/view/View;

    move-object v4, p0

    move v6, p1

    move v7, p2

    move v8, p3

    move v9, p4

    invoke-virtual/range {v4 .. v9}, Lb/j/a/c;->a(Landroid/view/View;IIII)I

    move-result v6

    .line 12
    iget-object v1, p0, Lb/j/a/c;->q:Landroid/widget/OverScroller;

    move v4, p1

    move v5, p2

    invoke-virtual/range {v1 .. v6}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    const/4 p1, 0x2

    .line 13
    invoke-virtual {p0, p1}, Lb/j/a/c;->f(I)V

    const/4 p1, 0x1

    return p1
.end method

.method public b(Landroid/view/View;I)Z
    .registers 5

    .line 52
    iget-object v0, p0, Lb/j/a/c;->s:Landroid/view/View;

    const/4 v1, 0x1

    if-ne p1, v0, :cond_a

    iget v0, p0, Lb/j/a/c;->c:I

    if-ne v0, p2, :cond_a

    return v1

    :cond_a
    if-eqz p1, :cond_1a

    .line 53
    iget-object v0, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    invoke-virtual {v0, p1, p2}, Lb/j/a/c$c;->b(Landroid/view/View;I)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 54
    iput p2, p0, Lb/j/a/c;->c:I

    .line 55
    invoke-virtual {p0, p1, p2}, Lb/j/a/c;->a(Landroid/view/View;I)V

    return v1

    :cond_1a
    const/4 p1, 0x0

    return p1
.end method

.method public b(Landroid/view/View;II)Z
    .registers 4

    .line 2
    iput-object p1, p0, Lb/j/a/c;->s:Landroid/view/View;

    const/4 p1, -0x1

    .line 3
    iput p1, p0, Lb/j/a/c;->c:I

    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p2, p3, p1, p1}, Lb/j/a/c;->b(IIII)Z

    move-result p1

    if-nez p1, :cond_17

    .line 5
    iget p2, p0, Lb/j/a/c;->a:I

    if-nez p2, :cond_17

    iget-object p2, p0, Lb/j/a/c;->s:Landroid/view/View;

    if-eqz p2, :cond_17

    const/4 p2, 0x0

    .line 6
    iput-object p2, p0, Lb/j/a/c;->s:Landroid/view/View;

    :cond_17
    return p1
.end method

.method public final c(II)I
    .registers 6

    .line 76
    iget-object v0, p0, Lb/j/a/c;->u:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLeft()I

    move-result v0

    iget v1, p0, Lb/j/a/c;->o:I

    add-int/2addr v0, v1

    if-ge p1, v0, :cond_d

    const/4 v0, 0x1

    goto :goto_e

    :cond_d
    const/4 v0, 0x0

    .line 77
    :goto_e
    iget-object v1, p0, Lb/j/a/c;->u:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getTop()I

    move-result v1

    iget v2, p0, Lb/j/a/c;->o:I

    add-int/2addr v1, v2

    if-ge p2, v1, :cond_1b

    or-int/lit8 v0, v0, 0x4

    .line 78
    :cond_1b
    iget-object v1, p0, Lb/j/a/c;->u:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getRight()I

    move-result v1

    iget v2, p0, Lb/j/a/c;->o:I

    sub-int/2addr v1, v2

    if-le p1, v1, :cond_28

    or-int/lit8 v0, v0, 0x2

    .line 79
    :cond_28
    iget-object p1, p0, Lb/j/a/c;->u:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getBottom()I

    move-result p1

    iget v1, p0, Lb/j/a/c;->o:I

    sub-int/2addr p1, v1

    if-le p2, p1, :cond_35

    or-int/lit8 v0, v0, 0x8

    :cond_35
    return v0
.end method

.method public c()Landroid/view/View;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/j/a/c;->s:Landroid/view/View;

    return-object v0
.end method

.method public final c(I)V
    .registers 11

    .line 2
    iget-object v0, p0, Lb/j/a/c;->d:[F

    if-eqz v0, :cond_7

    array-length v0, v0

    if-gt v0, p1, :cond_52

    :cond_7
    add-int/lit8 p1, p1, 0x1

    .line 3
    new-array v0, p1, [F

    .line 4
    new-array v1, p1, [F

    .line 5
    new-array v2, p1, [F

    .line 6
    new-array v3, p1, [F

    .line 7
    new-array v4, p1, [I

    .line 8
    new-array v5, p1, [I

    .line 9
    new-array p1, p1, [I

    .line 10
    iget-object v6, p0, Lb/j/a/c;->d:[F

    if-eqz v6, :cond_44

    .line 11
    array-length v7, v6

    const/4 v8, 0x0

    invoke-static {v6, v8, v0, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 12
    iget-object v6, p0, Lb/j/a/c;->e:[F

    array-length v7, v6

    invoke-static {v6, v8, v1, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 13
    iget-object v6, p0, Lb/j/a/c;->f:[F

    array-length v7, v6

    invoke-static {v6, v8, v2, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 14
    iget-object v6, p0, Lb/j/a/c;->g:[F

    array-length v7, v6

    invoke-static {v6, v8, v3, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 15
    iget-object v6, p0, Lb/j/a/c;->h:[I

    array-length v7, v6

    invoke-static {v6, v8, v4, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 16
    iget-object v6, p0, Lb/j/a/c;->i:[I

    array-length v7, v6

    invoke-static {v6, v8, v5, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 17
    iget-object v6, p0, Lb/j/a/c;->j:[I

    array-length v7, v6

    invoke-static {v6, v8, p1, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 18
    :cond_44
    iput-object v0, p0, Lb/j/a/c;->d:[F

    .line 19
    iput-object v1, p0, Lb/j/a/c;->e:[F

    .line 20
    iput-object v2, p0, Lb/j/a/c;->f:[F

    .line 21
    iput-object v3, p0, Lb/j/a/c;->g:[F

    .line 22
    iput-object v4, p0, Lb/j/a/c;->h:[I

    .line 23
    iput-object v5, p0, Lb/j/a/c;->i:[I

    .line 24
    iput-object p1, p0, Lb/j/a/c;->j:[I

    :cond_52
    return-void
.end method

.method public c(Landroid/view/MotionEvent;)Z
    .registers 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 25
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    .line 26
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v3

    if-nez v2, :cond_11

    .line 27
    invoke-virtual/range {p0 .. p0}, Lb/j/a/c;->a()V

    .line 28
    :cond_11
    iget-object v4, v0, Lb/j/a/c;->l:Landroid/view/VelocityTracker;

    if-nez v4, :cond_1b

    .line 29
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v4

    iput-object v4, v0, Lb/j/a/c;->l:Landroid/view/VelocityTracker;

    .line 30
    :cond_1b
    iget-object v4, v0, Lb/j/a/c;->l:Landroid/view/VelocityTracker;

    invoke-virtual {v4, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    const/4 v4, 0x2

    const/4 v6, 0x1

    if-eqz v2, :cond_104

    if-eq v2, v6, :cond_ff

    if-eq v2, v4, :cond_70

    const/4 v7, 0x3

    if-eq v2, v7, :cond_ff

    const/4 v7, 0x5

    if-eq v2, v7, :cond_3c

    const/4 v4, 0x6

    if-eq v2, v4, :cond_34

    :cond_31
    :goto_31
    const/4 v5, 0x0

    goto/16 :goto_135

    .line 31
    :cond_34
    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Lb/j/a/c;->b(I)V

    goto :goto_31

    .line 33
    :cond_3c
    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    .line 34
    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    .line 35
    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    .line 36
    invoke-virtual {v0, v7, v1, v2}, Lb/j/a/c;->b(FFI)V

    .line 37
    iget v3, v0, Lb/j/a/c;->a:I

    if-nez v3, :cond_60

    .line 38
    iget-object v1, v0, Lb/j/a/c;->h:[I

    aget v1, v1, v2

    .line 39
    iget v3, v0, Lb/j/a/c;->p:I

    and-int v4, v1, v3

    if-eqz v4, :cond_31

    .line 40
    iget-object v4, v0, Lb/j/a/c;->r:Lb/j/a/c$c;

    and-int/2addr v1, v3

    invoke-virtual {v4, v1, v2}, Lb/j/a/c$c;->b(II)V

    goto :goto_31

    :cond_60
    if-ne v3, v4, :cond_31

    float-to-int v3, v7

    float-to-int v1, v1

    .line 41
    invoke-virtual {v0, v3, v1}, Lb/j/a/c;->b(II)Landroid/view/View;

    move-result-object v1

    .line 42
    iget-object v3, v0, Lb/j/a/c;->s:Landroid/view/View;

    if-ne v1, v3, :cond_31

    .line 43
    invoke-virtual {v0, v1, v2}, Lb/j/a/c;->b(Landroid/view/View;I)Z

    goto :goto_31

    .line 44
    :cond_70
    iget-object v2, v0, Lb/j/a/c;->d:[F

    if-eqz v2, :cond_31

    iget-object v2, v0, Lb/j/a/c;->e:[F

    if-nez v2, :cond_79

    goto :goto_31

    .line 45
    :cond_79
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    const/4 v3, 0x0

    :goto_7e
    if-ge v3, v2, :cond_fa

    .line 46
    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v4

    .line 47
    invoke-virtual {v0, v4}, Lb/j/a/c;->e(I)Z

    move-result v7

    if-nez v7, :cond_8c

    goto/16 :goto_f7

    .line 48
    :cond_8c
    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    .line 49
    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v8

    .line 50
    iget-object v9, v0, Lb/j/a/c;->d:[F

    aget v9, v9, v4

    sub-float v9, v7, v9

    .line 51
    iget-object v10, v0, Lb/j/a/c;->e:[F

    aget v10, v10, v4

    sub-float v10, v8, v10

    float-to-int v7, v7

    float-to-int v8, v8

    .line 52
    invoke-virtual {v0, v7, v8}, Lb/j/a/c;->b(II)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_b0

    .line 53
    invoke-virtual {v0, v7, v9, v10}, Lb/j/a/c;->a(Landroid/view/View;FF)Z

    move-result v8

    if-eqz v8, :cond_b0

    const/4 v8, 0x1

    goto :goto_b1

    :cond_b0
    const/4 v8, 0x0

    :goto_b1
    if-eqz v8, :cond_e6

    .line 54
    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v11

    float-to-int v12, v9

    add-int v13, v11, v12

    .line 55
    iget-object v14, v0, Lb/j/a/c;->r:Lb/j/a/c$c;

    invoke-virtual {v14, v7, v13, v12}, Lb/j/a/c$c;->a(Landroid/view/View;II)I

    move-result v12

    .line 56
    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v13

    float-to-int v14, v10

    add-int v15, v13, v14

    .line 57
    iget-object v5, v0, Lb/j/a/c;->r:Lb/j/a/c$c;

    invoke-virtual {v5, v7, v15, v14}, Lb/j/a/c$c;->b(Landroid/view/View;II)I

    move-result v5

    .line 58
    iget-object v14, v0, Lb/j/a/c;->r:Lb/j/a/c$c;

    invoke-virtual {v14, v7}, Lb/j/a/c$c;->a(Landroid/view/View;)I

    move-result v14

    .line 59
    iget-object v15, v0, Lb/j/a/c;->r:Lb/j/a/c$c;

    invoke-virtual {v15, v7}, Lb/j/a/c$c;->b(Landroid/view/View;)I

    move-result v15

    if-eqz v14, :cond_df

    if-lez v14, :cond_e6

    if-ne v12, v11, :cond_e6

    :cond_df
    if-eqz v15, :cond_fa

    if-lez v15, :cond_e6

    if-ne v5, v13, :cond_e6

    goto :goto_fa

    .line 60
    :cond_e6
    invoke-virtual {v0, v9, v10, v4}, Lb/j/a/c;->a(FFI)V

    .line 61
    iget v5, v0, Lb/j/a/c;->a:I

    if-ne v5, v6, :cond_ee

    goto :goto_fa

    :cond_ee
    if-eqz v8, :cond_f7

    .line 62
    invoke-virtual {v0, v7, v4}, Lb/j/a/c;->b(Landroid/view/View;I)Z

    move-result v4

    if-eqz v4, :cond_f7

    goto :goto_fa

    :cond_f7
    :goto_f7
    add-int/lit8 v3, v3, 0x1

    goto :goto_7e

    .line 63
    :cond_fa
    :goto_fa
    invoke-virtual/range {p0 .. p1}, Lb/j/a/c;->b(Landroid/view/MotionEvent;)V

    goto/16 :goto_31

    .line 64
    :cond_ff
    invoke-virtual/range {p0 .. p0}, Lb/j/a/c;->a()V

    goto/16 :goto_31

    .line 65
    :cond_104
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    .line 66
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    const/4 v5, 0x0

    .line 67
    invoke-virtual {v1, v5}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 68
    invoke-virtual {v0, v2, v3, v1}, Lb/j/a/c;->b(FFI)V

    float-to-int v2, v2

    float-to-int v3, v3

    .line 69
    invoke-virtual {v0, v2, v3}, Lb/j/a/c;->b(II)Landroid/view/View;

    move-result-object v2

    .line 70
    iget-object v3, v0, Lb/j/a/c;->s:Landroid/view/View;

    if-ne v2, v3, :cond_125

    iget v3, v0, Lb/j/a/c;->a:I

    if-ne v3, v4, :cond_125

    .line 71
    invoke-virtual {v0, v2, v1}, Lb/j/a/c;->b(Landroid/view/View;I)Z

    .line 72
    :cond_125
    iget-object v2, v0, Lb/j/a/c;->h:[I

    aget v2, v2, v1

    .line 73
    iget v3, v0, Lb/j/a/c;->p:I

    and-int v4, v2, v3

    if-eqz v4, :cond_135

    .line 74
    iget-object v4, v0, Lb/j/a/c;->r:Lb/j/a/c$c;

    and-int/2addr v2, v3

    invoke-virtual {v4, v2, v1}, Lb/j/a/c$c;->b(II)V

    .line 75
    :cond_135
    :goto_135
    iget v1, v0, Lb/j/a/c;->a:I

    if-ne v1, v6, :cond_13a

    const/4 v5, 0x1

    :cond_13a
    return v5
.end method

.method public d()I
    .registers 2

    .line 1
    iget v0, p0, Lb/j/a/c;->o:I

    return v0
.end method

.method public d(I)Z
    .registers 4

    .line 2
    iget v0, p0, Lb/j/a/c;->k:I

    const/4 v1, 0x1

    shl-int p1, v1, p1

    and-int/2addr p1, v0

    if-eqz p1, :cond_9

    goto :goto_a

    :cond_9
    const/4 v1, 0x0

    :goto_a
    return v1
.end method

.method public d(II)Z
    .registers 4

    .line 3
    iget-object v0, p0, Lb/j/a/c;->s:Landroid/view/View;

    invoke-virtual {p0, v0, p1, p2}, Lb/j/a/c;->a(Landroid/view/View;II)Z

    move-result p1

    return p1
.end method

.method public e()I
    .registers 2

    .line 1
    iget v0, p0, Lb/j/a/c;->b:I

    return v0
.end method

.method public final e(I)Z
    .registers 4

    .line 8
    invoke-virtual {p0, p1}, Lb/j/a/c;->d(I)Z

    move-result v0

    if-nez v0, :cond_2d

    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Ignoring pointerId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " because ACTION_DOWN was not received "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "for this pointer before ACTION_MOVE. It likely happened because "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " ViewDragHelper did not receive all the events in the event stream."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ViewDragHelper"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return p1

    :cond_2d
    const/4 p1, 0x1

    return p1
.end method

.method public e(II)Z
    .registers 6

    .line 2
    iget-boolean v0, p0, Lb/j/a/c;->t:Z

    if-eqz v0, :cond_1b

    .line 3
    iget-object v0, p0, Lb/j/a/c;->l:Landroid/view/VelocityTracker;

    iget v1, p0, Lb/j/a/c;->c:I

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v0

    float-to-int v0, v0

    iget-object v1, p0, Lb/j/a/c;->l:Landroid/view/VelocityTracker;

    iget v2, p0, Lb/j/a/c;->c:I

    .line 5
    invoke-virtual {v1, v2}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v1

    float-to-int v1, v1

    .line 6
    invoke-virtual {p0, p1, p2, v0, v1}, Lb/j/a/c;->b(IIII)Z

    move-result p1

    return p1

    .line 7
    :cond_1b
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Cannot settleCapturedViewAt outside of a call to Callback#onViewReleased"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public f()I
    .registers 2

    .line 1
    iget v0, p0, Lb/j/a/c;->a:I

    return v0
.end method

.method public f(I)V
    .registers 4

    .line 2
    iget-object v0, p0, Lb/j/a/c;->u:Landroid/view/ViewGroup;

    iget-object v1, p0, Lb/j/a/c;->v:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 3
    iget v0, p0, Lb/j/a/c;->a:I

    if-eq v0, p1, :cond_19

    .line 4
    iput p1, p0, Lb/j/a/c;->a:I

    .line 5
    iget-object v0, p0, Lb/j/a/c;->r:Lb/j/a/c$c;

    invoke-virtual {v0, p1}, Lb/j/a/c$c;->c(I)V

    .line 6
    iget p1, p0, Lb/j/a/c;->a:I

    if-nez p1, :cond_19

    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Lb/j/a/c;->s:Landroid/view/View;

    :cond_19
    return-void
.end method

.method public final g()V
    .registers 5

    .line 2
    iget-object v0, p0, Lb/j/a/c;->l:Landroid/view/VelocityTracker;

    iget v1, p0, Lb/j/a/c;->m:F

    const/16 v2, 0x3e8

    invoke-virtual {v0, v2, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 3
    iget-object v0, p0, Lb/j/a/c;->l:Landroid/view/VelocityTracker;

    iget v1, p0, Lb/j/a/c;->c:I

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v0

    iget v1, p0, Lb/j/a/c;->n:F

    iget v2, p0, Lb/j/a/c;->m:F

    .line 5
    invoke-virtual {p0, v0, v1, v2}, Lb/j/a/c;->a(FFF)F

    move-result v0

    .line 6
    iget-object v1, p0, Lb/j/a/c;->l:Landroid/view/VelocityTracker;

    iget v2, p0, Lb/j/a/c;->c:I

    .line 7
    invoke-virtual {v1, v2}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v1

    iget v2, p0, Lb/j/a/c;->n:F

    iget v3, p0, Lb/j/a/c;->m:F

    .line 8
    invoke-virtual {p0, v1, v2, v3}, Lb/j/a/c;->a(FFF)F

    move-result v1

    .line 9
    invoke-virtual {p0, v0, v1}, Lb/j/a/c;->a(FF)V

    return-void
.end method

.method public g(I)V
    .registers 2

    .line 1
    iput p1, p0, Lb/j/a/c;->p:I

    return-void
.end method
