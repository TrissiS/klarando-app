.class public abstract Lcom/google/android/material/slider/BaseSlider;
.super Landroid/view/View;
.source "BaseSlider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/slider/BaseSlider$e;,
        Lcom/google/android/material/slider/BaseSlider$SliderState;,
        Lcom/google/android/material/slider/BaseSlider$d;,
        Lcom/google/android/material/slider/BaseSlider$f;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Lcom/google/android/material/slider/BaseSlider<",
        "TS;T",
        "L;",
        "TT;>;",
        "L::Lc/a/a/a/m0/a<",
        "TS;>;T::",
        "Lc/a/a/a/m0/b<",
        "TS;>;>",
        "Landroid/view/View;"
    }
.end annotation


# static fields
.field public static final j0:Ljava/lang/String;

.field public static final k0:I


# instance fields
.field public A:I

.field public B:I

.field public C:I

.field public D:I

.field public E:I

.field public F:I

.field public G:I

.field public H:I

.field public I:F

.field public J:Landroid/view/MotionEvent;

.field public K:Lc/a/a/a/m0/c;

.field public L:Z

.field public M:F

.field public N:F

.field public O:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public P:I

.field public Q:I

.field public R:F

.field public S:[F

.field public T:Z

.field public U:I

.field public V:Z

.field public W:Z

.field public a0:Z

.field public b0:Landroid/content/res/ColorStateList;

.field public c0:Landroid/content/res/ColorStateList;

.field public d0:Landroid/content/res/ColorStateList;

.field public e0:Landroid/content/res/ColorStateList;

.field public f0:Landroid/content/res/ColorStateList;

.field public final g0:Lc/a/a/a/l0/h;

.field public final h:Landroid/graphics/Paint;

.field public h0:F

.field public final i:Landroid/graphics/Paint;

.field public i0:I

.field public final j:Landroid/graphics/Paint;

.field public final k:Landroid/graphics/Paint;

.field public final l:Landroid/graphics/Paint;

.field public final m:Landroid/graphics/Paint;

.field public final n:Lcom/google/android/material/slider/BaseSlider$e;

.field public final o:Landroid/view/accessibility/AccessibilityManager;

.field public p:Lcom/google/android/material/slider/BaseSlider$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/material/slider/BaseSlider<",
            "TS;T",
            "L;",
            "TT;>.d;"
        }
    .end annotation
.end field

.field public final q:Lcom/google/android/material/slider/BaseSlider$f;

.field public final r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lc/a/a/a/s0/a;",
            ">;"
        }
    .end annotation
.end field

.field public final s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "T",
            "L;",
            ">;"
        }
    .end annotation
.end field

.field public final t:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field

.field public u:Z

.field public v:Landroid/animation/ValueAnimator;

.field public w:Landroid/animation/ValueAnimator;

.field public final x:I

.field public y:I

.field public z:I


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    const-class v0, Lcom/google/android/material/slider/BaseSlider;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/material/slider/BaseSlider;->j0:Ljava/lang/String;

    .line 2
    sget v0, Lc/a/a/a/k;->Widget_MaterialComponents_Slider:I

    sput v0, Lcom/google/android/material/slider/BaseSlider;->k0:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/material/slider/BaseSlider;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lc/a/a/a/b;->sliderStyle:I

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/slider/BaseSlider;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 8

    .line 3
    sget v0, Lcom/google/android/material/slider/BaseSlider;->k0:I

    invoke-static {p1, p2, p3, v0}, Lc/a/a/a/q0/a/a;->b(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->r:Ljava/util/List;

    .line 5
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->s:Ljava/util/List;

    .line 6
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->t:Ljava/util/List;

    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/google/android/material/slider/BaseSlider;->u:Z

    .line 8
    iput-boolean p1, p0, Lcom/google/android/material/slider/BaseSlider;->L:Z

    .line 9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    const/4 v0, -0x1

    .line 10
    iput v0, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    .line 11
    iput v0, p0, Lcom/google/android/material/slider/BaseSlider;->Q:I

    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider;->T:Z

    .line 14
    iput-boolean p1, p0, Lcom/google/android/material/slider/BaseSlider;->W:Z

    .line 15
    new-instance v1, Lc/a/a/a/l0/h;

    invoke-direct {v1}, Lc/a/a/a/l0/h;-><init>()V

    iput-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->g0:Lc/a/a/a/l0/h;

    .line 16
    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->i0:I

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 18
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->h:Landroid/graphics/Paint;

    .line 19
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 20
    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->h:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 21
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->i:Landroid/graphics/Paint;

    .line 22
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 23
    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->i:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 24
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->j:Landroid/graphics/Paint;

    .line 25
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 26
    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->j:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/PorterDuffXfermode;

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v2, v3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 27
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->k:Landroid/graphics/Paint;

    .line 28
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 29
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->l:Landroid/graphics/Paint;

    .line 30
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 31
    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->l:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 32
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->m:Landroid/graphics/Paint;

    .line 33
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 34
    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->m:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 35
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->a(Landroid/content/res/Resources;)V

    .line 36
    new-instance v1, Lcom/google/android/material/slider/BaseSlider$a;

    invoke-direct {v1, p0, p2, p3}, Lcom/google/android/material/slider/BaseSlider$a;-><init>(Lcom/google/android/material/slider/BaseSlider;Landroid/util/AttributeSet;I)V

    iput-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->q:Lcom/google/android/material/slider/BaseSlider$f;

    .line 37
    invoke-virtual {p0, p1, p2, p3}, Lcom/google/android/material/slider/BaseSlider;->a(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 38
    invoke-virtual {p0, v0}, Landroid/view/View;->setFocusable(Z)V

    .line 39
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 40
    iget-object p2, p0, Lcom/google/android/material/slider/BaseSlider;->g0:Lc/a/a/a/l0/h;

    const/4 p3, 0x2

    invoke-virtual {p2, p3}, Lc/a/a/a/l0/h;->d(I)V

    .line 41
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->x:I

    .line 42
    new-instance p1, Lcom/google/android/material/slider/BaseSlider$e;

    invoke-direct {p1, p0}, Lcom/google/android/material/slider/BaseSlider$e;-><init>(Lcom/google/android/material/slider/BaseSlider;)V

    iput-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->n:Lcom/google/android/material/slider/BaseSlider$e;

    .line 43
    invoke-static {p0, p1}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/a;)V

    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "accessibility"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/accessibility/AccessibilityManager;

    iput-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->o:Landroid/view/accessibility/AccessibilityManager;

    return-void
.end method

.method public static a(Landroid/animation/ValueAnimator;F)F
    .registers 3

    if-eqz p0, :cond_15

    .line 82
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 83
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    .line 84
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_15
    return p1
.end method

.method public static synthetic a(Lcom/google/android/material/slider/BaseSlider;I)F
    .registers 2

    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->b(I)F

    move-result p0

    return p0
.end method

.method public static a([FF)I
    .registers 2

    .line 74
    array-length p0, p0

    div-int/lit8 p0, p0, 0x2

    add-int/lit8 p0, p0, -0x1

    int-to-float p0, p0

    mul-float p1, p1, p0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method public static synthetic a(Landroid/content/Context;Landroid/content/res/TypedArray;)Lc/a/a/a/s0/a;
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->b(Landroid/content/Context;Landroid/content/res/TypedArray;)Lc/a/a/a/s0/a;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Lcom/google/android/material/slider/BaseSlider;F)Ljava/lang/String;
    .registers 2

    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->b(F)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Lcom/google/android/material/slider/BaseSlider;)Ljava/util/List;
    .registers 1

    .line 2
    iget-object p0, p0, Lcom/google/android/material/slider/BaseSlider;->r:Ljava/util/List;

    return-object p0
.end method

.method public static synthetic a(Lcom/google/android/material/slider/BaseSlider;IF)Z
    .registers 3

    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/slider/BaseSlider;->b(IF)Z

    move-result p0

    return p0
.end method

.method public static b(Landroid/content/Context;Landroid/content/res/TypedArray;)Lc/a/a/a/s0/a;
    .registers 4

    .line 2
    sget v0, Lc/a/a/a/l;->Slider_labelStyle:I

    sget v1, Lc/a/a/a/k;->Widget_MaterialComponents_Tooltip:I

    .line 3
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 4
    invoke-static {p0, v0, v1, p1}, Lc/a/a/a/s0/a;->a(Landroid/content/Context;Landroid/util/AttributeSet;II)Lc/a/a/a/s0/a;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Lcom/google/android/material/slider/BaseSlider;)Lcom/google/android/material/slider/BaseSlider$e;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/slider/BaseSlider;->n:Lcom/google/android/material/slider/BaseSlider$e;

    return-object p0
.end method

.method public static synthetic c(Lcom/google/android/material/slider/BaseSlider;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->r()V

    return-void
.end method

.method private getActiveRange()[F
    .registers 7

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->getValues()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->max(Ljava/util/Collection;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->getValues()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->min(Ljava/util/Collection;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 3
    iget-object v2, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_27

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    :cond_27
    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->c(F)F

    move-result v1

    .line 4
    invoke-virtual {p0, v0}, Lcom/google/android/material/slider/BaseSlider;->c(F)F

    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->j()Z

    move-result v2

    const/4 v4, 0x0

    const/4 v5, 0x2

    if-eqz v2, :cond_3e

    new-array v2, v5, [F

    aput v0, v2, v4

    aput v1, v2, v3

    goto :goto_44

    :cond_3e
    new-array v2, v5, [F

    aput v1, v2, v4

    aput v0, v2, v3

    :goto_44
    return-object v2
.end method

.method private getValueOfTouchPosition()F
    .registers 7

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->h0:F

    invoke-virtual {p0, v0}, Lcom/google/android/material/slider/BaseSlider;->e(F)D

    move-result-wide v0

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->j()Z

    move-result v2

    if-eqz v2, :cond_10

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    sub-double v0, v2, v0

    .line 3
    :cond_10
    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    iget v3, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    sub-float/2addr v2, v3

    float-to-double v4, v2

    mul-double v0, v0, v4

    float-to-double v2, v3

    add-double/2addr v0, v2

    double-to-float v0, v0

    return v0
.end method

.method private getValueOfTouchPositionAbsolute()F
    .registers 4

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->h0:F

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->j()Z

    move-result v1

    if-eqz v1, :cond_c

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v0, v1, v0

    .line 3
    :cond_c
    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    sub-float/2addr v1, v2

    mul-float v0, v0, v1

    add-float/2addr v0, v2

    return v0
.end method

.method private setValuesInternal(Ljava/util/ArrayList;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_33

    .line 2
    invoke-static {p1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 3
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v0, v1, :cond_1e

    .line 4
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    return-void

    .line 5
    :cond_1e
    iput-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Lcom/google/android/material/slider/BaseSlider;->a0:Z

    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->Q:I

    .line 8
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->r()V

    .line 9
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->c()V

    .line 10
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->d()V

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    return-void

    .line 12
    :cond_33
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "At least one value must be set"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public final a()F
    .registers 3

    .line 123
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-nez v1, :cond_9

    const/high16 v0, 0x3f800000    # 1.0f

    :cond_9
    return v0
.end method

.method public final a(F)F
    .registers 4

    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-nez v1, :cond_6

    return v0

    .line 81
    :cond_6
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->D:I

    int-to-float v0, v0

    sub-float/2addr p1, v0

    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->U:I

    int-to-float v0, v0

    div-float/2addr p1, v0

    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    sub-float v1, v0, v1

    mul-float p1, p1, v1

    add-float/2addr p1, v0

    return p1
.end method

.method public final a(IF)F
    .registers 6

    .line 75
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_b

    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->getMinSeparation()F

    move-result v1

    .line 76
    :cond_b
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->i0:I

    if-nez v0, :cond_13

    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->a(F)F

    move-result v1

    .line 77
    :cond_13
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->j()Z

    move-result v0

    if-eqz v0, :cond_1a

    neg-float v1, v1

    :cond_1a
    add-int/lit8 v0, p1, 0x1

    .line 78
    iget-object v2, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v0, v2, :cond_27

    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    goto :goto_34

    :cond_27
    iget-object v2, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    sub-float/2addr v0, v1

    :goto_34
    add-int/lit8 p1, p1, -0x1

    if-gez p1, :cond_3b

    .line 79
    iget p1, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    goto :goto_48

    :cond_3b
    iget-object v2, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    add-float/2addr p1, v1

    .line 80
    :goto_48
    invoke-static {p2, p1, v0}, Lb/h/h/a;->a(FFF)F

    move-result p1

    return p1
.end method

.method public final a(Landroid/content/res/ColorStateList;)I
    .registers 4

    .line 101
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    return p1
.end method

.method public final a(Z)Landroid/animation/ValueAnimator;
    .registers 6

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    if-eqz p1, :cond_7

    const/4 v2, 0x0

    goto :goto_9

    :cond_7
    const/high16 v2, 0x3f800000    # 1.0f

    :goto_9
    if-eqz p1, :cond_e

    .line 85
    iget-object v3, p0, Lcom/google/android/material/slider/BaseSlider;->w:Landroid/animation/ValueAnimator;

    goto :goto_10

    :cond_e
    iget-object v3, p0, Lcom/google/android/material/slider/BaseSlider;->v:Landroid/animation/ValueAnimator;

    .line 86
    :goto_10
    invoke-static {v3, v2}, Lcom/google/android/material/slider/BaseSlider;->a(Landroid/animation/ValueAnimator;F)F

    move-result v2

    if-eqz p1, :cond_18

    const/high16 v0, 0x3f800000    # 1.0f

    :cond_18
    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v3, 0x0

    aput v2, v1, v3

    const/4 v2, 0x1

    aput v0, v1, v2

    .line 87
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    if-eqz p1, :cond_2a

    const-wide/16 v1, 0x53

    goto :goto_2c

    :cond_2a
    const-wide/16 v1, 0x75

    .line 88
    :goto_2c
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    if-eqz p1, :cond_34

    .line 89
    sget-object p1, Lc/a/a/a/m/a;->e:Landroid/animation/TimeInterpolator;

    goto :goto_36

    :cond_34
    sget-object p1, Lc/a/a/a/m/a;->c:Landroid/animation/TimeInterpolator;

    :goto_36
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 90
    new-instance p1, Lcom/google/android/material/slider/BaseSlider$b;

    invoke-direct {p1, p0}, Lcom/google/android/material/slider/BaseSlider$b;-><init>(Lcom/google/android/material/slider/BaseSlider;)V

    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-object v0
.end method

.method public final a(ILandroid/view/KeyEvent;)Ljava/lang/Boolean;
    .registers 6

    const/16 v0, 0x3d

    const/4 v1, -0x1

    const/4 v2, 0x1

    if-eq p1, v0, :cond_47

    const/16 p2, 0x42

    if-eq p1, p2, :cond_3b

    const/16 p2, 0x51

    if-eq p1, p2, :cond_33

    const/16 p2, 0x45

    if-eq p1, p2, :cond_2b

    const/16 p2, 0x46

    if-eq p1, p2, :cond_33

    packed-switch p1, :pswitch_data_6c

    const/4 p1, 0x0

    return-object p1

    .line 102
    :pswitch_1b
    invoke-virtual {p0, v2}, Lcom/google/android/material/slider/BaseSlider;->f(I)Z

    .line 103
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 104
    :pswitch_23
    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->f(I)Z

    .line 105
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 106
    :cond_2b
    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->e(I)Z

    .line 107
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 108
    :cond_33
    invoke-virtual {p0, v2}, Lcom/google/android/material/slider/BaseSlider;->e(I)Z

    .line 109
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 110
    :cond_3b
    :pswitch_3b
    iget p1, p0, Lcom/google/android/material/slider/BaseSlider;->Q:I

    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    .line 111
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 112
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 113
    :cond_47
    invoke-virtual {p2}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result p1

    if-eqz p1, :cond_56

    .line 114
    invoke-virtual {p0, v2}, Lcom/google/android/material/slider/BaseSlider;->e(I)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    .line 115
    :cond_56
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result p1

    if-eqz p1, :cond_65

    .line 116
    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->e(I)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :cond_65
    const/4 p1, 0x0

    .line 117
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    nop

    :pswitch_data_6c
    .packed-switch 0x15
        :pswitch_23
        :pswitch_1b
        :pswitch_3b
    .end packed-switch
.end method

.method public final a(I)Ljava/lang/Float;
    .registers 4

    .line 118
    iget-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider;->W:Z

    if-eqz v0, :cond_b

    const/16 v0, 0x14

    invoke-virtual {p0, v0}, Lcom/google/android/material/slider/BaseSlider;->b(I)F

    move-result v0

    goto :goto_f

    :cond_b
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->a()F

    move-result v0

    :goto_f
    const/16 v1, 0x15

    if-eq p1, v1, :cond_3c

    const/16 v1, 0x16

    if-eq p1, v1, :cond_30

    const/16 v1, 0x45

    if-eq p1, v1, :cond_2a

    const/16 v1, 0x46

    if-eq p1, v1, :cond_25

    const/16 v1, 0x51

    if-eq p1, v1, :cond_25

    const/4 p1, 0x0

    return-object p1

    .line 119
    :cond_25
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    return-object p1

    :cond_2a
    neg-float p1, v0

    .line 120
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    return-object p1

    .line 121
    :cond_30
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->j()Z

    move-result p1

    if-eqz p1, :cond_37

    neg-float v0, v0

    :cond_37
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    return-object p1

    .line 122
    :cond_3c
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->j()Z

    move-result p1

    if-eqz p1, :cond_43

    goto :goto_44

    :cond_43
    neg-float v0, v0

    :goto_44
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    return-object p1
.end method

.method public a(ILandroid/graphics/Rect;)V
    .registers 7

    .line 124
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->D:I

    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->getValues()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->c(F)F

    move-result p1

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->U:I

    int-to-float v1, v1

    mul-float p1, p1, v1

    float-to-int p1, p1

    add-int/2addr v0, p1

    .line 125
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->b()I

    move-result p1

    .line 126
    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->F:I

    sub-int v2, v0, v1

    sub-int v3, p1, v1

    add-int/2addr v0, v1

    add-int/2addr p1, v1

    invoke-virtual {p2, v2, v3, v0, p1}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 11

    .line 12
    sget-object v2, Lc/a/a/a/l;->Slider:[I

    sget v4, Lcom/google/android/material/slider/BaseSlider;->k0:I

    const/4 v6, 0x0

    new-array v5, v6, [I

    move-object v0, p1

    move-object v1, p2

    move v3, p3

    .line 13
    invoke-static/range {v0 .. v5}, Lc/a/a/a/d0/m;->c(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 14
    sget p3, Lc/a/a/a/l;->Slider_android_valueFrom:I

    const/4 v0, 0x0

    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p3

    iput p3, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    .line 15
    sget p3, Lc/a/a/a/l;->Slider_android_valueTo:I

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p3

    iput p3, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    const/4 p3, 0x1

    new-array v1, p3, [Ljava/lang/Float;

    .line 16
    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v1, v6

    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->setValues([Ljava/lang/Float;)V

    .line 17
    sget v1, Lc/a/a/a/l;->Slider_android_stepSize:I

    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    .line 18
    sget v1, Lc/a/a/a/l;->Slider_trackColor:I

    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_42

    .line 19
    sget v2, Lc/a/a/a/l;->Slider_trackColor:I

    goto :goto_44

    :cond_42
    sget v2, Lc/a/a/a/l;->Slider_trackColorInactive:I

    :goto_44
    if-eqz v1, :cond_49

    .line 20
    sget v1, Lc/a/a/a/l;->Slider_trackColor:I

    goto :goto_4b

    :cond_49
    sget v1, Lc/a/a/a/l;->Slider_trackColorActive:I

    .line 21
    :goto_4b
    invoke-static {p1, p2, v2}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    if-eqz v2, :cond_52

    goto :goto_58

    .line 22
    :cond_52
    sget v2, Lc/a/a/a/c;->material_slider_inactive_track_color:I

    .line 23
    invoke-static {p1, v2}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    .line 24
    :goto_58
    invoke-virtual {p0, v2}, Lcom/google/android/material/slider/BaseSlider;->setTrackInactiveTintList(Landroid/content/res/ColorStateList;)V

    .line 25
    invoke-static {p1, p2, v1}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    if-eqz v1, :cond_62

    goto :goto_68

    .line 26
    :cond_62
    sget v1, Lc/a/a/a/c;->material_slider_active_track_color:I

    .line 27
    invoke-static {p1, v1}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 28
    :goto_68
    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->setTrackActiveTintList(Landroid/content/res/ColorStateList;)V

    .line 29
    sget v1, Lc/a/a/a/l;->Slider_thumbColor:I

    .line 30
    invoke-static {p1, p2, v1}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 31
    iget-object v2, p0, Lcom/google/android/material/slider/BaseSlider;->g0:Lc/a/a/a/l0/h;

    invoke-virtual {v2, v1}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    .line 32
    sget v1, Lc/a/a/a/l;->Slider_thumbStrokeColor:I

    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_87

    .line 33
    sget v1, Lc/a/a/a/l;->Slider_thumbStrokeColor:I

    .line 34
    invoke-static {p1, p2, v1}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 35
    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->setThumbStrokeColor(Landroid/content/res/ColorStateList;)V

    .line 36
    :cond_87
    sget v1, Lc/a/a/a/l;->Slider_thumbStrokeWidth:I

    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->setThumbStrokeWidth(F)V

    .line 37
    sget v1, Lc/a/a/a/l;->Slider_haloColor:I

    .line 38
    invoke-static {p1, p2, v1}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    if-eqz v1, :cond_99

    goto :goto_9f

    .line 39
    :cond_99
    sget v1, Lc/a/a/a/c;->material_slider_halo_color:I

    .line 40
    invoke-static {p1, v1}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 41
    :goto_9f
    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->setHaloTintList(Landroid/content/res/ColorStateList;)V

    .line 42
    sget v1, Lc/a/a/a/l;->Slider_tickVisible:I

    invoke-virtual {p2, v1, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/google/android/material/slider/BaseSlider;->T:Z

    .line 43
    sget v1, Lc/a/a/a/l;->Slider_tickColor:I

    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_b5

    .line 44
    sget v2, Lc/a/a/a/l;->Slider_tickColor:I

    goto :goto_b7

    :cond_b5
    sget v2, Lc/a/a/a/l;->Slider_tickColorInactive:I

    :goto_b7
    if-eqz v1, :cond_bc

    .line 45
    sget v1, Lc/a/a/a/l;->Slider_tickColor:I

    goto :goto_be

    :cond_bc
    sget v1, Lc/a/a/a/l;->Slider_tickColorActive:I

    .line 46
    :goto_be
    invoke-static {p1, p2, v2}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    if-eqz v2, :cond_c5

    goto :goto_cb

    .line 47
    :cond_c5
    sget v2, Lc/a/a/a/c;->material_slider_inactive_tick_marks_color:I

    .line 48
    invoke-static {p1, v2}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    .line 49
    :goto_cb
    invoke-virtual {p0, v2}, Lcom/google/android/material/slider/BaseSlider;->setTickInactiveTintList(Landroid/content/res/ColorStateList;)V

    .line 50
    invoke-static {p1, p2, v1}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    if-eqz v1, :cond_d5

    goto :goto_db

    .line 51
    :cond_d5
    sget v1, Lc/a/a/a/c;->material_slider_active_tick_marks_color:I

    .line 52
    invoke-static {p1, v1}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 53
    :goto_db
    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->setTickActiveTintList(Landroid/content/res/ColorStateList;)V

    .line 54
    sget p1, Lc/a/a/a/l;->Slider_thumbRadius:I

    invoke-virtual {p2, p1, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->setThumbRadius(I)V

    .line 55
    sget p1, Lc/a/a/a/l;->Slider_haloRadius:I

    invoke-virtual {p2, p1, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->setHaloRadius(I)V

    .line 56
    sget p1, Lc/a/a/a/l;->Slider_thumbElevation:I

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->setThumbElevation(F)V

    .line 57
    sget p1, Lc/a/a/a/l;->Slider_trackHeight:I

    invoke-virtual {p2, p1, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->setTrackHeight(I)V

    .line 58
    sget p1, Lc/a/a/a/l;->Slider_labelBehavior:I

    invoke-virtual {p2, p1, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->B:I

    .line 59
    sget p1, Lc/a/a/a/l;->Slider_android_enabled:I

    invoke-virtual {p2, p1, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    if-nez p1, :cond_115

    .line 60
    invoke-virtual {p0, v6}, Lcom/google/android/material/slider/BaseSlider;->setEnabled(Z)V

    .line 61
    :cond_115
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public final a(Landroid/content/res/Resources;)V
    .registers 3

    .line 6
    sget v0, Lc/a/a/a/d;->mtrl_slider_widget_height:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/slider/BaseSlider;->A:I

    .line 7
    sget v0, Lc/a/a/a/d;->mtrl_slider_track_side_padding:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/slider/BaseSlider;->y:I

    .line 8
    iput v0, p0, Lcom/google/android/material/slider/BaseSlider;->D:I

    .line 9
    sget v0, Lc/a/a/a/d;->mtrl_slider_thumb_radius:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/slider/BaseSlider;->z:I

    .line 10
    sget v0, Lc/a/a/a/d;->mtrl_slider_track_top:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    iput v0, p0, Lcom/google/android/material/slider/BaseSlider;->E:I

    .line 11
    sget v0, Lc/a/a/a/d;->mtrl_slider_label_padding:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->H:I

    return-void
.end method

.method public final a(Landroid/graphics/Canvas;)V
    .registers 7

    .line 67
    iget-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider;->T:Z

    if-eqz v0, :cond_3f

    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_c

    goto :goto_3f

    .line 68
    :cond_c
    invoke-direct {p0}, Lcom/google/android/material/slider/BaseSlider;->getActiveRange()[F

    move-result-object v0

    .line 69
    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->S:[F

    const/4 v2, 0x0

    aget v3, v0, v2

    invoke-static {v1, v3}, Lcom/google/android/material/slider/BaseSlider;->a([FF)I

    move-result v1

    .line 70
    iget-object v3, p0, Lcom/google/android/material/slider/BaseSlider;->S:[F

    const/4 v4, 0x1

    aget v0, v0, v4

    invoke-static {v3, v0}, Lcom/google/android/material/slider/BaseSlider;->a([FF)I

    move-result v0

    .line 71
    iget-object v3, p0, Lcom/google/android/material/slider/BaseSlider;->S:[F

    mul-int/lit8 v1, v1, 0x2

    iget-object v4, p0, Lcom/google/android/material/slider/BaseSlider;->l:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v2, v1, v4}, Landroid/graphics/Canvas;->drawPoints([FIILandroid/graphics/Paint;)V

    .line 72
    iget-object v2, p0, Lcom/google/android/material/slider/BaseSlider;->S:[F

    mul-int/lit8 v0, v0, 0x2

    sub-int v3, v0, v1

    iget-object v4, p0, Lcom/google/android/material/slider/BaseSlider;->m:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v1, v3, v4}, Landroid/graphics/Canvas;->drawPoints([FIILandroid/graphics/Paint;)V

    .line 73
    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->S:[F

    array-length v2, v1

    sub-int/2addr v2, v0

    iget-object v3, p0, Lcom/google/android/material/slider/BaseSlider;->l:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/graphics/Canvas;->drawPoints([FIILandroid/graphics/Paint;)V

    :cond_3f
    :goto_3f
    return-void
.end method

.method public final a(Landroid/graphics/Canvas;II)V
    .registers 14

    .line 63
    invoke-direct {p0}, Lcom/google/android/material/slider/BaseSlider;->getActiveRange()[F

    move-result-object v0

    .line 64
    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->D:I

    int-to-float v2, v1

    const/4 v3, 0x1

    aget v3, v0, v3

    int-to-float p2, p2

    mul-float v3, v3, p2

    add-float v7, v2, v3

    int-to-float v1, v1

    const/4 v2, 0x0

    .line 65
    aget v0, v0, v2

    mul-float v0, v0, p2

    add-float v5, v1, v0

    int-to-float v8, p3

    .line 66
    iget-object v9, p0, Lcom/google/android/material/slider/BaseSlider;->i:Landroid/graphics/Paint;

    move-object v4, p1

    move v6, v8

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public final a(Lc/a/a/a/s0/a;)V
    .registers 3

    .line 62
    invoke-static {p0}, Lc/a/a/a/d0/t;->a(Landroid/view/View;)Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {p1, v0}, Lc/a/a/a/s0/a;->b(Landroid/view/View;)V

    return-void
.end method

.method public final a(Lc/a/a/a/s0/a;F)V
    .registers 6

    .line 91
    invoke-virtual {p0, p2}, Lcom/google/android/material/slider/BaseSlider;->b(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lc/a/a/a/s0/a;->a(Ljava/lang/CharSequence;)V

    .line 92
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->D:I

    .line 93
    invoke-virtual {p0, p2}, Lcom/google/android/material/slider/BaseSlider;->c(F)F

    move-result p2

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->U:I

    int-to-float v1, v1

    mul-float p2, p2, v1

    float-to-int p2, p2

    add-int/2addr v0, p2

    .line 94
    invoke-virtual {p1}, Lc/a/a/a/s0/a;->getIntrinsicWidth()I

    move-result p2

    div-int/lit8 p2, p2, 0x2

    sub-int/2addr v0, p2

    .line 95
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->b()I

    move-result p2

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->H:I

    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->F:I

    add-int/2addr v1, v2

    sub-int/2addr p2, v1

    .line 96
    invoke-virtual {p1}, Lc/a/a/a/s0/a;->getIntrinsicHeight()I

    move-result v1

    sub-int v1, p2, v1

    invoke-virtual {p1}, Lc/a/a/a/s0/a;->getIntrinsicWidth()I

    move-result v2

    add-int/2addr v2, v0

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 97
    new-instance p2, Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 98
    invoke-static {p0}, Lc/a/a/a/d0/t;->a(Landroid/view/View;)Landroid/view/ViewGroup;

    move-result-object v0

    invoke-static {v0, p0, p2}, Lc/a/a/a/d0/c;->b(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/Rect;)V

    .line 99
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 100
    invoke-static {p0}, Lc/a/a/a/d0/t;->b(Landroid/view/View;)Lc/a/a/a/d0/s;

    move-result-object p2

    invoke-interface {p2, p1}, Lc/a/a/a/d0/s;->a(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final b(I)F
    .registers 5

    .line 23
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->a()F

    move-result v0

    .line 24
    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    sub-float/2addr v1, v2

    div-float/2addr v1, v0

    int-to-float p1, p1

    cmpg-float v2, v1, p1

    if-gtz v2, :cond_10

    return v0

    :cond_10
    div-float/2addr v1, p1

    .line 25
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result p1

    int-to-float p1, p1

    mul-float p1, p1, v0

    return p1
.end method

.method public final b()I
    .registers 5

    .line 8
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->E:I

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->B:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, v3, :cond_14

    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->r:Ljava/util/List;

    .line 9
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc/a/a/a/s0/a;

    invoke-virtual {v1}, Lc/a/a/a/s0/a;->getIntrinsicHeight()I

    move-result v2

    :cond_14
    add-int/2addr v0, v2

    return v0
.end method

.method public final b(F)Ljava/lang/String;
    .registers 5

    .line 20
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->g()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 21
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->K:Lc/a/a/a/m0/c;

    invoke-interface {v0, p1}, Lc/a/a/a/m0/c;->a(F)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_d
    float-to-int v0, p1

    int-to-float v0, v0

    cmpl-float v0, v0, p1

    if-nez v0, :cond_16

    const-string v0, "%.0f"

    goto :goto_18

    :cond_16
    const-string v0, "%.2f"

    :goto_18
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 22
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final b(Landroid/graphics/Canvas;II)V
    .registers 15

    .line 10
    invoke-direct {p0}, Lcom/google/android/material/slider/BaseSlider;->getActiveRange()[F

    move-result-object v0

    .line 11
    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->D:I

    int-to-float v2, v1

    const/4 v3, 0x1

    aget v3, v0, v3

    int-to-float v4, p2

    mul-float v3, v3, v4

    add-float v6, v2, v3

    add-int v2, v1, p2

    int-to-float v2, v2

    cmpg-float v2, v6, v2

    if-gez v2, :cond_20

    int-to-float v9, p3

    add-int/2addr v1, p2

    int-to-float v8, v1

    .line 12
    iget-object v10, p0, Lcom/google/android/material/slider/BaseSlider;->h:Landroid/graphics/Paint;

    move-object v5, p1

    move v7, v9

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 13
    :cond_20
    iget p2, p0, Lcom/google/android/material/slider/BaseSlider;->D:I

    int-to-float v1, p2

    const/4 v2, 0x0

    aget v0, v0, v2

    mul-float v0, v0, v4

    add-float v5, v1, v0

    int-to-float v0, p2

    cmpl-float v0, v5, v0

    if-lez v0, :cond_38

    int-to-float v3, p2

    int-to-float v6, p3

    .line 14
    iget-object v7, p0, Lcom/google/android/material/slider/BaseSlider;->h:Landroid/graphics/Paint;

    move-object v2, p1

    move v4, v6

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :cond_38
    return-void
.end method

.method public final b(Lc/a/a/a/s0/a;)V
    .registers 3

    .line 5
    invoke-static {p0}, Lc/a/a/a/d0/t;->b(Landroid/view/View;)Lc/a/a/a/d0/s;

    move-result-object v0

    if-eqz v0, :cond_10

    .line 6
    invoke-interface {v0, p1}, Lc/a/a/a/d0/s;->b(Landroid/graphics/drawable/Drawable;)V

    .line 7
    invoke-static {p0}, Lc/a/a/a/d0/t;->a(Landroid/view/View;)Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {p1, v0}, Lc/a/a/a/s0/a;->a(Landroid/view/View;)V

    :cond_10
    return-void
.end method

.method public final b(IF)Z
    .registers 8

    .line 15
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    sub-float v0, p2, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    float-to-double v0, v0

    const-wide v2, 0x3f1a36e2eb1c432dL    # 1.0E-4

    cmpg-double v4, v0, v2

    if-gez v4, :cond_1e

    const/4 p1, 0x0

    return p1

    .line 16
    :cond_1e
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/slider/BaseSlider;->a(IF)F

    move-result p2

    .line 17
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 18
    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->Q:I

    .line 19
    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->c(I)V

    const/4 p1, 0x1

    return p1
.end method

.method public final c(F)F
    .registers 4

    .line 16
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    sub-float/2addr p1, v0

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    sub-float/2addr v1, v0

    div-float/2addr p1, v1

    .line 17
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->j()Z

    move-result v0

    if-eqz v0, :cond_11

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p1

    return v0

    :cond_11
    return p1
.end method

.method public final c()V
    .registers 5

    .line 2
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->r:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v0, v1, :cond_3d

    .line 3
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->r:Ljava/util/List;

    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget-object v2, p0, Lcom/google/android/material/slider/BaseSlider;->r:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {v0, v1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    .line 4
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_24
    :goto_24
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lc/a/a/a/s0/a;

    .line 5
    invoke-static {p0}, Lb/h/m/y;->J(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_24

    .line 6
    invoke-virtual {p0, v2}, Lcom/google/android/material/slider/BaseSlider;->b(Lc/a/a/a/s0/a;)V

    goto :goto_24

    .line 7
    :cond_3a
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 8
    :cond_3d
    :goto_3d
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->r:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_60

    .line 9
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->q:Lcom/google/android/material/slider/BaseSlider$f;

    invoke-interface {v0}, Lcom/google/android/material/slider/BaseSlider$f;->a()Lc/a/a/a/s0/a;

    move-result-object v0

    .line 10
    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->r:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 11
    invoke-static {p0}, Lb/h/m/y;->J(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 12
    invoke-virtual {p0, v0}, Lcom/google/android/material/slider/BaseSlider;->a(Lc/a/a/a/s0/a;)V

    goto :goto_3d

    .line 13
    :cond_60
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->r:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_6a

    const/4 v1, 0x0

    .line 14
    :cond_6a
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->r:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_70
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_81

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lc/a/a/a/s0/a;

    int-to-float v3, v1

    .line 15
    invoke-virtual {v2, v3}, Lc/a/a/a/l0/h;->e(F)V

    goto :goto_70

    :cond_81
    return-void
.end method

.method public final c(I)V
    .registers 6

    .line 30
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->s:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_23

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc/a/a/a/m0/a;

    .line 31
    iget-object v2, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    const/4 v3, 0x1

    invoke-interface {v1, p0, v2, v3}, Lc/a/a/a/m0/a;->a(Ljava/lang/Object;FZ)V

    goto :goto_6

    .line 32
    :cond_23
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->o:Landroid/view/accessibility/AccessibilityManager;

    if-eqz v0, :cond_30

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_30

    .line 33
    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->g(I)V

    :cond_30
    return-void
.end method

.method public final c(Landroid/graphics/Canvas;II)V
    .registers 9

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_31

    .line 19
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_31

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    .line 20
    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->D:I

    int-to-float v2, v2

    .line 21
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->c(F)F

    move-result v1

    int-to-float v3, p2

    mul-float v1, v1, v3

    add-float/2addr v2, v1

    int-to-float v1, p3

    iget v3, p0, Lcom/google/android/material/slider/BaseSlider;->F:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/google/android/material/slider/BaseSlider;->j:Landroid/graphics/Paint;

    .line 22
    invoke-virtual {p1, v2, v1, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_c

    .line 23
    :cond_31
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_37
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_68

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    .line 24
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 25
    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->D:I

    .line 26
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->c(F)F

    move-result v1

    int-to-float v3, p2

    mul-float v1, v1, v3

    float-to-int v1, v1

    add-int/2addr v2, v1

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->F:I

    sub-int/2addr v2, v1

    int-to-float v2, v2

    sub-int v1, p3, v1

    int-to-float v1, v1

    .line 27
    invoke-virtual {p1, v2, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 28
    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->g0:Lc/a/a/a/l0/h;

    invoke-virtual {v1, p1}, Lc/a/a/a/l0/h;->draw(Landroid/graphics/Canvas;)V

    .line 29
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    goto :goto_37

    :cond_68
    return-void
.end method

.method public final d()V
    .registers 6

    .line 7
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->s:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc/a/a/a/m0/a;

    .line 8
    iget-object v2, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_18
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    .line 9
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    const/4 v4, 0x0

    invoke-interface {v1, p0, v3, v4}, Lc/a/a/a/m0/a;->a(Ljava/lang/Object;FZ)V

    goto :goto_18

    :cond_2d
    return-void
.end method

.method public final d(I)V
    .registers 5

    const/4 v0, 0x1

    const v1, 0x7fffffff

    if-eq p1, v0, :cond_20

    const/4 v0, 0x2

    const/high16 v2, -0x80000000

    if-eq p1, v0, :cond_1c

    const/16 v0, 0x11

    if-eq p1, v0, :cond_18

    const/16 v0, 0x42

    if-eq p1, v0, :cond_14

    goto :goto_23

    .line 10
    :cond_14
    invoke-virtual {p0, v2}, Lcom/google/android/material/slider/BaseSlider;->f(I)Z

    goto :goto_23

    .line 11
    :cond_18
    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->f(I)Z

    goto :goto_23

    .line 12
    :cond_1c
    invoke-virtual {p0, v2}, Lcom/google/android/material/slider/BaseSlider;->e(I)Z

    goto :goto_23

    .line 13
    :cond_20
    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->e(I)Z

    :goto_23
    return-void
.end method

.method public final d(Landroid/graphics/Canvas;II)V
    .registers 12

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->p()Z

    move-result v0

    if-eqz v0, :cond_43

    .line 2
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->D:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->Q:I

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->c(F)F

    move-result v1

    int-to-float p2, p2

    mul-float v1, v1, p2

    add-float/2addr v0, v1

    float-to-int p2, v0

    .line 3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-ge v0, v1, :cond_39

    .line 4
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->G:I

    sub-int v1, p2, v0

    int-to-float v3, v1

    sub-int v1, p3, v0

    int-to-float v4, v1

    add-int v1, p2, v0

    int-to-float v5, v1

    add-int/2addr v0, p3

    int-to-float v6, v0

    sget-object v7, Landroid/graphics/Region$Op;->UNION:Landroid/graphics/Region$Op;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->clipRect(FFFFLandroid/graphics/Region$Op;)Z

    :cond_39
    int-to-float p2, p2

    int-to-float p3, p3

    .line 5
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->G:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->k:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, p3, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :cond_43
    return-void
.end method

.method public final d(F)Z
    .registers 3

    .line 6
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    invoke-virtual {p0, v0, p1}, Lcom/google/android/material/slider/BaseSlider;->b(IF)Z

    move-result p1

    return p1
.end method

.method public dispatchHoverEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->n:Lcom/google/android/material/slider/BaseSlider$e;

    invoke-virtual {v0, p1}, Lb/j/a/a;->a(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_11

    invoke-super {p0, p1}, Landroid/view/View;->dispatchHoverEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_f

    goto :goto_11

    :cond_f
    const/4 p1, 0x0

    goto :goto_12

    :cond_11
    :goto_11
    const/4 p1, 0x1

    :goto_12
    return p1
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public drawableStateChanged()V
    .registers 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->drawableStateChanged()V

    .line 2
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->h:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->f0:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->a(Landroid/content/res/ColorStateList;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 3
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->i:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->e0:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->a(Landroid/content/res/ColorStateList;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->l:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->d0:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->a(Landroid/content/res/ColorStateList;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 5
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->m:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->c0:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->a(Landroid/content/res/ColorStateList;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->r:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_35
    :goto_35
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc/a/a/a/s0/a;

    .line 7
    invoke-virtual {v1}, Lc/a/a/a/l0/h;->isStateful()Z

    move-result v2

    if-eqz v2, :cond_35

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    goto :goto_35

    .line 9
    :cond_4f
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->g0:Lc/a/a/a/l0/h;

    invoke-virtual {v0}, Lc/a/a/a/l0/h;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_60

    .line 10
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->g0:Lc/a/a/a/l0/h;

    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 11
    :cond_60
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->k:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->b0:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->a(Landroid/content/res/ColorStateList;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 12
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->k:Landroid/graphics/Paint;

    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public final e(F)D
    .registers 7

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-lez v1, :cond_19

    .line 2
    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    sub-float/2addr v1, v2

    div-float/2addr v1, v0

    float-to-int v0, v1

    int-to-float v1, v0

    mul-float p1, p1, v1

    .line 3
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    int-to-double v1, p1

    int-to-double v3, v0

    div-double/2addr v1, v3

    return-wide v1

    :cond_19
    float-to-double v0, p1

    return-wide v0
.end method

.method public final e()V
    .registers 8

    .line 4
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->B:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_6

    return-void

    .line 5
    :cond_6
    iget-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider;->u:Z

    const/4 v2, 0x1

    if-nez v0, :cond_19

    .line 6
    iput-boolean v2, p0, Lcom/google/android/material/slider/BaseSlider;->u:Z

    .line 7
    invoke-virtual {p0, v2}, Lcom/google/android/material/slider/BaseSlider;->a(Z)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->v:Landroid/animation/ValueAnimator;

    const/4 v3, 0x0

    .line 8
    iput-object v3, p0, Lcom/google/android/material/slider/BaseSlider;->w:Landroid/animation/ValueAnimator;

    .line 9
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 10
    :cond_19
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->r:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 11
    :goto_21
    iget-object v5, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_4c

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4c

    .line 12
    iget v5, p0, Lcom/google/android/material/slider/BaseSlider;->Q:I

    if-ne v4, v5, :cond_34

    goto :goto_49

    .line 13
    :cond_34
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lc/a/a/a/s0/a;

    iget-object v6, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-virtual {p0, v5, v6}, Lcom/google/android/material/slider/BaseSlider;->a(Lc/a/a/a/s0/a;F)V

    :goto_49
    add-int/lit8 v4, v4, 0x1

    goto :goto_21

    .line 14
    :cond_4c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6a

    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc/a/a/a/s0/a;

    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->Q:I

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/material/slider/BaseSlider;->a(Lc/a/a/a/s0/a;F)V

    return-void

    .line 16
    :cond_6a
    new-instance v0, Ljava/lang/IllegalStateException;

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/google/android/material/slider/BaseSlider;->r:Ljava/util/List;

    .line 17
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v3

    iget-object v3, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "Not enough labels(%d) to display all the values(%d)"

    .line 18
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final e(I)Z
    .registers 13

    .line 19
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->Q:I

    int-to-long v1, v0

    int-to-long v3, p1

    add-long v5, v1, v3

    .line 20
    iget-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v1, 0x1

    sub-int/2addr p1, v1

    int-to-long v9, p1

    const-wide/16 v7, 0x0

    invoke-static/range {v5 .. v10}, Lb/h/h/a;->a(JJJ)J

    move-result-wide v2

    long-to-int p1, v2

    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->Q:I

    if-ne p1, v0, :cond_1c

    const/4 p1, 0x0

    return p1

    .line 21
    :cond_1c
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    const/4 v2, -0x1

    if-eq v0, v2, :cond_23

    .line 22
    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    .line 23
    :cond_23
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->r()V

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    return v1
.end method

.method public final f()V
    .registers 3

    .line 7
    iget-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider;->u:Z

    if-eqz v0, :cond_1d

    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider;->u:Z

    .line 9
    invoke-virtual {p0, v0}, Lcom/google/android/material/slider/BaseSlider;->a(Z)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->w:Landroid/animation/ValueAnimator;

    const/4 v1, 0x0

    .line 10
    iput-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->v:Landroid/animation/ValueAnimator;

    .line 11
    new-instance v1, Lcom/google/android/material/slider/BaseSlider$c;

    invoke-direct {v1, p0}, Lcom/google/android/material/slider/BaseSlider$c;-><init>(Lcom/google/android/material/slider/BaseSlider;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 12
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->w:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    :cond_1d
    return-void
.end method

.method public final f(F)Z
    .registers 6

    .line 1
    new-instance v0, Ljava/math/BigDecimal;

    .line 2
    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    new-instance p1, Ljava/math/BigDecimal;

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    .line 3
    invoke-static {v1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object p1

    new-instance v0, Ljava/math/BigDecimal;

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    .line 4
    invoke-static {v1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    sget-object v1, Ljava/math/MathContext;->DECIMAL64:Ljava/math/MathContext;

    invoke-virtual {p1, v0, v1}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;Ljava/math/MathContext;)Ljava/math/BigDecimal;

    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v0

    .line 6
    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v2

    long-to-double v2, v2

    sub-double/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    const-wide v2, 0x3f1a36e2eb1c432dL    # 1.0E-4

    cmpg-double p1, v0, v2

    if-gez p1, :cond_42

    const/4 p1, 0x1

    goto :goto_43

    :cond_42
    const/4 p1, 0x0

    :goto_43
    return p1
.end method

.method public final f(I)Z
    .registers 3

    .line 13
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->j()Z

    move-result v0

    if-eqz v0, :cond_f

    const/high16 v0, -0x80000000

    if-ne p1, v0, :cond_e

    const p1, 0x7fffffff

    goto :goto_f

    :cond_e
    neg-int p1, p1

    .line 14
    :cond_f
    :goto_f
    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->e(I)Z

    move-result p1

    return p1
.end method

.method public final g(F)F
    .registers 3

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->c(F)F

    move-result p1

    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->U:I

    int-to-float v0, v0

    mul-float p1, p1, v0

    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->D:I

    int-to-float v0, v0

    add-float/2addr p1, v0

    return p1
.end method

.method public final g(I)V
    .registers 4

    .line 3
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->p:Lcom/google/android/material/slider/BaseSlider$d;

    if-nez v0, :cond_d

    .line 4
    new-instance v0, Lcom/google/android/material/slider/BaseSlider$d;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/material/slider/BaseSlider$d;-><init>(Lcom/google/android/material/slider/BaseSlider;Lcom/google/android/material/slider/BaseSlider$a;)V

    iput-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->p:Lcom/google/android/material/slider/BaseSlider$d;

    goto :goto_10

    .line 5
    :cond_d
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 6
    :goto_10
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->p:Lcom/google/android/material/slider/BaseSlider$d;

    invoke-virtual {v0, p1}, Lcom/google/android/material/slider/BaseSlider$d;->a(I)V

    .line 7
    iget-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->p:Lcom/google/android/material/slider/BaseSlider$d;

    const-wide/16 v0, 0xc8

    invoke-virtual {p0, p1, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public g()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->K:Lc/a/a/a/m0/c;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public getAccessibilityClassName()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    const-class v0, Landroid/widget/SeekBar;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getAccessibilityFocusedVirtualViewId()I
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->n:Lcom/google/android/material/slider/BaseSlider$e;

    invoke-virtual {v0}, Lb/j/a/a;->d()I

    move-result v0

    return v0
.end method

.method public getActiveThumbIndex()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    return v0
.end method

.method public getFocusedThumbIndex()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->Q:I

    return v0
.end method

.method public getHaloRadius()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->G:I

    return v0
.end method

.method public getHaloTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->b0:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getLabelBehavior()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->B:I

    return v0
.end method

.method public getMinSeparation()F
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public getStepSize()F
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    return v0
.end method

.method public getThumbElevation()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->g0:Lc/a/a/a/l0/h;

    invoke-virtual {v0}, Lc/a/a/a/l0/h;->g()F

    move-result v0

    return v0
.end method

.method public getThumbRadius()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->F:I

    return v0
.end method

.method public getThumbStrokeColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->g0:Lc/a/a/a/l0/h;

    invoke-virtual {v0}, Lc/a/a/a/l0/h;->o()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getThumbStrokeWidth()F
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->g0:Lc/a/a/a/l0/h;

    invoke-virtual {v0}, Lc/a/a/a/l0/h;->q()F

    move-result v0

    return v0
.end method

.method public getThumbTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->g0:Lc/a/a/a/l0/h;

    invoke-virtual {v0}, Lc/a/a/a/l0/h;->h()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getTickActiveTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->c0:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getTickInactiveTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->d0:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getTickTintList()Landroid/content/res/ColorStateList;
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->d0:Landroid/content/res/ColorStateList;

    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->c0:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 2
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->c0:Landroid/content/res/ColorStateList;

    return-object v0

    .line 3
    :cond_d
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The inactive and active ticks are different colors. Use the getTickColorInactive() and getTickColorActive() methods instead."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTrackActiveTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->e0:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getTrackHeight()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->C:I

    return v0
.end method

.method public getTrackInactiveTintList()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->f0:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getTrackSidePadding()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->D:I

    return v0
.end method

.method public getTrackTintList()Landroid/content/res/ColorStateList;
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->f0:Landroid/content/res/ColorStateList;

    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->e0:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 2
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->e0:Landroid/content/res/ColorStateList;

    return-object v0

    .line 3
    :cond_d
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The inactive and active parts of the track are different colors. Use the getInactiveTrackColor() and getActiveTrackColor() methods instead."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getTrackWidth()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->U:I

    return v0
.end method

.method public getValueFrom()F
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    return v0
.end method

.method public getValueTo()F
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    return v0
.end method

.method public getValues()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public final h()V
    .registers 4

    .line 3
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->h:Landroid/graphics/Paint;

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->C:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 4
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->i:Landroid/graphics/Paint;

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->C:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 5
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->l:Landroid/graphics/Paint;

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->C:I

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 6
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->m:Landroid/graphics/Paint;

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->C:I

    int-to-float v1, v1

    div-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method

.method public final h(I)V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->D:I

    mul-int/lit8 v0, v0, 0x2

    sub-int/2addr p1, v0

    const/4 v0, 0x0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->U:I

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->k()V

    return-void
.end method

.method public final i()Z
    .registers 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 2
    :goto_4
    instance-of v1, v0, Landroid/view/ViewGroup;

    const/4 v2, 0x0

    if-eqz v1, :cond_29

    .line 3
    move-object v1, v0

    check-cast v1, Landroid/view/ViewGroup;

    const/4 v3, 0x1

    .line 4
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->canScrollVertically(I)Z

    move-result v4

    if-nez v4, :cond_1a

    const/4 v4, -0x1

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->canScrollVertically(I)Z

    move-result v4

    if-eqz v4, :cond_1b

    :cond_1a
    const/4 v2, 0x1

    :cond_1b
    if-eqz v2, :cond_24

    .line 5
    invoke-virtual {v1}, Landroid/view/ViewGroup;->shouldDelayChildPressedState()Z

    move-result v1

    if-eqz v1, :cond_24

    return v3

    .line 6
    :cond_24
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_4

    :cond_29
    return v2
.end method

.method public final j()Z
    .registers 3

    .line 1
    invoke-static {p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    goto :goto_9

    :cond_8
    const/4 v1, 0x0

    :goto_9
    return v1
.end method

.method public final k()V
    .registers 7

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_8

    return-void

    .line 2
    :cond_8
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->s()V

    .line 3
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    div-float/2addr v0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    add-float/2addr v0, v1

    float-to-int v0, v0

    .line 4
    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->U:I

    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->C:I

    mul-int/lit8 v2, v2, 0x2

    div-int/2addr v1, v2

    add-int/lit8 v1, v1, 0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 5
    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->S:[F

    if-eqz v1, :cond_2d

    array-length v1, v1

    mul-int/lit8 v2, v0, 0x2

    if-eq v1, v2, :cond_33

    :cond_2d
    mul-int/lit8 v1, v0, 0x2

    .line 6
    new-array v1, v1, [F

    iput-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->S:[F

    .line 7
    :cond_33
    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->U:I

    int-to-float v1, v1

    add-int/lit8 v2, v0, -0x1

    int-to-float v2, v2

    div-float/2addr v1, v2

    const/4 v2, 0x0

    :goto_3b
    mul-int/lit8 v3, v0, 0x2

    if-ge v2, v3, :cond_58

    .line 8
    iget-object v3, p0, Lcom/google/android/material/slider/BaseSlider;->S:[F

    iget v4, p0, Lcom/google/android/material/slider/BaseSlider;->D:I

    int-to-float v4, v4

    div-int/lit8 v5, v2, 0x2

    int-to-float v5, v5

    mul-float v5, v5, v1

    add-float/2addr v4, v5

    aput v4, v3, v2

    add-int/lit8 v4, v2, 0x1

    .line 9
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->b()I

    move-result v5

    int-to-float v5, v5

    aput v5, v3, v4

    add-int/lit8 v2, v2, 0x2

    goto :goto_3b

    :cond_58
    return-void
.end method

.method public final l()V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->F:I

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->z:I

    sub-int/2addr v0, v1

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 2
    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->y:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/android/material/slider/BaseSlider;->D:I

    .line 3
    invoke-static {p0}, Lb/h/m/y;->K(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/android/material/slider/BaseSlider;->h(I)V

    :cond_1c
    return-void
.end method

.method public final m()V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->t:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc/a/a/a/m0/b;

    .line 2
    invoke-interface {v1, p0}, Lc/a/a/a/m0/b;->a(Ljava/lang/Object;)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final n()V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->t:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc/a/a/a/m0/b;

    .line 2
    invoke-interface {v1, p0}, Lc/a/a/a/m0/b;->b(Ljava/lang/Object;)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public o()Z
    .registers 12

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    const/4 v1, -0x1

    const/4 v2, 0x1

    if-eq v0, v1, :cond_7

    return v2

    .line 2
    :cond_7
    invoke-direct {p0}, Lcom/google/android/material/slider/BaseSlider;->getValueOfTouchPositionAbsolute()F

    move-result v0

    .line 3
    invoke-virtual {p0, v0}, Lcom/google/android/material/slider/BaseSlider;->g(F)F

    move-result v3

    const/4 v4, 0x0

    .line 4
    iput v4, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    .line 5
    iget-object v5, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    sub-float/2addr v5, v0

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    const/4 v6, 0x1

    .line 6
    :goto_24
    iget-object v7, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v6, v7, :cond_91

    .line 7
    iget-object v7, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    sub-float/2addr v7, v0

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    .line 8
    iget-object v8, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Float;

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v8

    invoke-virtual {p0, v8}, Lcom/google/android/material/slider/BaseSlider;->g(F)F

    move-result v8

    .line 9
    invoke-static {v7, v5}, Ljava/lang/Float;->compare(FF)I

    move-result v9

    if-le v9, v2, :cond_54

    goto :goto_91

    .line 10
    :cond_54
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->j()Z

    move-result v9

    const/4 v10, 0x0

    if-eqz v9, :cond_62

    sub-float v9, v8, v3

    cmpl-float v9, v9, v10

    if-lez v9, :cond_6a

    goto :goto_68

    :cond_62
    sub-float v9, v8, v3

    cmpg-float v9, v9, v10

    if-gez v9, :cond_6a

    :goto_68
    const/4 v9, 0x1

    goto :goto_6b

    :cond_6a
    const/4 v9, 0x0

    .line 11
    :goto_6b
    invoke-static {v7, v5}, Ljava/lang/Float;->compare(FF)I

    move-result v10

    if-gez v10, :cond_74

    .line 12
    iput v6, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    goto :goto_8d

    .line 13
    :cond_74
    invoke-static {v7, v5}, Ljava/lang/Float;->compare(FF)I

    move-result v10

    if-nez v10, :cond_8e

    sub-float/2addr v8, v3

    .line 14
    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    iget v10, p0, Lcom/google/android/material/slider/BaseSlider;->x:I

    int-to-float v10, v10

    cmpg-float v8, v8, v10

    if-gez v8, :cond_89

    .line 15
    iput v1, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    return v4

    :cond_89
    if-eqz v9, :cond_8e

    .line 16
    iput v6, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    :goto_8d
    move v5, v7

    :cond_8e
    add-int/lit8 v6, v6, 0x1

    goto :goto_24

    .line 17
    :cond_91
    :goto_91
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    if-eq v0, v1, :cond_96

    goto :goto_97

    :cond_96
    const/4 v2, 0x0

    :goto_97
    return v2
.end method

.method public onAttachedToWindow()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->r:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc/a/a/a/s0/a;

    .line 3
    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->a(Lc/a/a/a/s0/a;)V

    goto :goto_9

    :cond_19
    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->p:Lcom/google/android/material/slider/BaseSlider$d;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_7
    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider;->u:Z

    .line 4
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->r:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc/a/a/a/s0/a;

    .line 5
    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->b(Lc/a/a/a/s0/a;)V

    goto :goto_10

    .line 6
    :cond_20
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 5

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider;->a0:Z

    if-eqz v0, :cond_a

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->s()V

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->k()V

    .line 4
    :cond_a
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->b()I

    move-result v0

    .line 6
    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->U:I

    invoke-virtual {p0, p1, v1, v0}, Lcom/google/android/material/slider/BaseSlider;->b(Landroid/graphics/Canvas;II)V

    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->getValues()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->max(Ljava/util/Collection;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_2f

    .line 8
    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->U:I

    invoke-virtual {p0, p1, v1, v0}, Lcom/google/android/material/slider/BaseSlider;->a(Landroid/graphics/Canvas;II)V

    .line 9
    :cond_2f
    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->a(Landroid/graphics/Canvas;)V

    .line 10
    iget-boolean v1, p0, Lcom/google/android/material/slider/BaseSlider;->L:Z

    if-nez v1, :cond_3c

    invoke-virtual {p0}, Landroid/view/View;->isFocused()Z

    move-result v1

    if-eqz v1, :cond_4f

    :cond_3c
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_4f

    .line 11
    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->U:I

    invoke-virtual {p0, p1, v1, v0}, Lcom/google/android/material/slider/BaseSlider;->d(Landroid/graphics/Canvas;II)V

    .line 12
    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_4f

    .line 13
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->e()V

    .line 14
    :cond_4f
    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->U:I

    invoke-virtual {p0, p1, v1, v0}, Lcom/google/android/material/slider/BaseSlider;->c(Landroid/graphics/Canvas;II)V

    return-void
.end method

.method public onFocusChanged(ZILandroid/graphics/Rect;)V
    .registers 4

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/view/View;->onFocusChanged(ZILandroid/graphics/Rect;)V

    if-nez p1, :cond_13

    const/4 p1, -0x1

    .line 2
    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->f()V

    .line 4
    iget-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->n:Lcom/google/android/material/slider/BaseSlider$e;

    iget p2, p0, Lcom/google/android/material/slider/BaseSlider;->Q:I

    invoke-virtual {p1, p2}, Lb/j/a/a;->b(I)Z

    goto :goto_1d

    .line 5
    :cond_13
    invoke-virtual {p0, p2}, Lcom/google/android/material/slider/BaseSlider;->d(I)V

    .line 6
    iget-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->n:Lcom/google/android/material/slider/BaseSlider$e;

    iget p2, p0, Lcom/google/android/material/slider/BaseSlider;->Q:I

    invoke-virtual {p1, p2}, Lb/j/a/a;->h(I)Z

    :goto_1d
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 8

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_b

    .line 2
    invoke-super {p0, p1, p2}, Landroid/view/View;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 3
    :cond_b
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_17

    .line 4
    iput v1, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    .line 5
    :cond_17
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    const/4 v3, -0x1

    if-ne v0, v3, :cond_2c

    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/slider/BaseSlider;->a(ILandroid/view/KeyEvent;)Ljava/lang/Boolean;

    move-result-object v0

    if-eqz v0, :cond_27

    .line 7
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    goto :goto_2b

    :cond_27
    invoke-super {p0, p1, p2}, Landroid/view/View;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    :goto_2b
    return p1

    .line 8
    :cond_2c
    iget-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider;->W:Z

    invoke-virtual {p2}, Landroid/view/KeyEvent;->isLongPress()Z

    move-result v4

    or-int/2addr v0, v4

    iput-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider;->W:Z

    .line 9
    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->a(I)Ljava/lang/Float;

    move-result-object v0

    if-eqz v0, :cond_5b

    .line 10
    iget-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    iget p2, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result p2

    add-float/2addr p1, p2

    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->d(F)Z

    move-result p1

    if-eqz p1, :cond_5a

    .line 11
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->r()V

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    :cond_5a
    return v2

    :cond_5b
    const/16 v0, 0x17

    if-eq p1, v0, :cond_83

    const/16 v0, 0x3d

    if-eq p1, v0, :cond_6c

    const/16 v0, 0x42

    if-eq p1, v0, :cond_83

    .line 13
    invoke-super {p0, p1, p2}, Landroid/view/View;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 14
    :cond_6c
    invoke-virtual {p2}, Landroid/view/KeyEvent;->hasNoModifiers()Z

    move-result p1

    if-eqz p1, :cond_77

    .line 15
    invoke-virtual {p0, v2}, Lcom/google/android/material/slider/BaseSlider;->e(I)Z

    move-result p1

    return p1

    .line 16
    :cond_77
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isShiftPressed()Z

    move-result p1

    if-eqz p1, :cond_82

    .line 17
    invoke-virtual {p0, v3}, Lcom/google/android/material/slider/BaseSlider;->e(I)Z

    move-result p1

    return p1

    :cond_82
    return v1

    .line 18
    :cond_83
    iput v3, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    .line 19
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->f()V

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    return v2
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 4

    const/4 v0, 0x0

    .line 1
    iput-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider;->W:Z

    .line 2
    invoke-super {p0, p1, p2}, Landroid/view/View;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public onMeasure(II)V
    .registers 6

    .line 1
    iget p2, p0, Lcom/google/android/material/slider/BaseSlider;->A:I

    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->B:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_14

    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->r:Ljava/util/List;

    .line 2
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc/a/a/a/s0/a;

    invoke-virtual {v0}, Lc/a/a/a/s0/a;->getIntrinsicHeight()I

    move-result v1

    :cond_14
    add-int/2addr p2, v1

    const/high16 v0, 0x40000000    # 2.0f

    .line 3
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 4
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 3

    .line 1
    check-cast p1, Lcom/google/android/material/slider/BaseSlider$SliderState;

    .line 2
    invoke-virtual {p1}, Landroid/view/View$BaseSavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 3
    iget v0, p1, Lcom/google/android/material/slider/BaseSlider$SliderState;->h:F

    iput v0, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    .line 4
    iget v0, p1, Lcom/google/android/material/slider/BaseSlider$SliderState;->i:F

    iput v0, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    .line 5
    iget-object v0, p1, Lcom/google/android/material/slider/BaseSlider$SliderState;->j:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/google/android/material/slider/BaseSlider;->setValuesInternal(Ljava/util/ArrayList;)V

    .line 6
    iget v0, p1, Lcom/google/android/material/slider/BaseSlider$SliderState;->k:F

    iput v0, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    .line 7
    iget-boolean p1, p1, Lcom/google/android/material/slider/BaseSlider$SliderState;->l:Z

    if-eqz p1, :cond_21

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 9
    :cond_21
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->d()V

    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    .line 2
    new-instance v1, Lcom/google/android/material/slider/BaseSlider$SliderState;

    invoke-direct {v1, v0}, Lcom/google/android/material/slider/BaseSlider$SliderState;-><init>(Landroid/os/Parcelable;)V

    .line 3
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    iput v0, v1, Lcom/google/android/material/slider/BaseSlider$SliderState;->h:F

    .line 4
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    iput v0, v1, Lcom/google/android/material/slider/BaseSlider$SliderState;->i:F

    .line 5
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, v1, Lcom/google/android/material/slider/BaseSlider$SliderState;->j:Ljava/util/ArrayList;

    .line 6
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    iput v0, v1, Lcom/google/android/material/slider/BaseSlider$SliderState;->k:F

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->hasFocus()Z

    move-result v0

    iput-boolean v0, v1, Lcom/google/android/material/slider/BaseSlider$SliderState;->l:Z

    return-object v1
.end method

.method public onSizeChanged(IIII)V
    .registers 5

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->h(I)V

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->r()V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    .line 2
    :cond_8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 3
    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->D:I

    int-to-float v2, v2

    sub-float v2, v0, v2

    iget v3, p0, Lcom/google/android/material/slider/BaseSlider;->U:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    iput v2, p0, Lcom/google/android/material/slider/BaseSlider;->h0:F

    const/4 v3, 0x0

    .line 4
    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Lcom/google/android/material/slider/BaseSlider;->h0:F

    const/high16 v3, 0x3f800000    # 1.0f

    .line 5
    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p0, Lcom/google/android/material/slider/BaseSlider;->h0:F

    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_c1

    if-eq v2, v3, :cond_6c

    const/4 v4, 0x2

    if-eq v2, v4, :cond_34

    goto/16 :goto_e9

    .line 7
    :cond_34
    iget-boolean v2, p0, Lcom/google/android/material/slider/BaseSlider;->L:Z

    if-nez v2, :cond_57

    .line 8
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->i()Z

    move-result v2

    if-eqz v2, :cond_4d

    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->I:F

    sub-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->x:I

    int-to-float v2, v2

    cmpg-float v0, v0, v2

    if-gez v0, :cond_4d

    return v1

    .line 9
    :cond_4d
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 10
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->m()V

    .line 11
    :cond_57
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->o()Z

    move-result v0

    if-nez v0, :cond_5f

    goto/16 :goto_e9

    .line 12
    :cond_5f
    iput-boolean v3, p0, Lcom/google/android/material/slider/BaseSlider;->L:Z

    .line 13
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->q()Z

    .line 14
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->r()V

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    goto/16 :goto_e9

    .line 16
    :cond_6c
    iput-boolean v1, p0, Lcom/google/android/material/slider/BaseSlider;->L:Z

    .line 17
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->J:Landroid/view/MotionEvent;

    if-eqz v0, :cond_ad

    .line 18
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_ad

    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->J:Landroid/view/MotionEvent;

    .line 19
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->x:I

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_ad

    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->J:Landroid/view/MotionEvent;

    .line 20
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->x:I

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_ad

    .line 21
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->o()Z

    move-result v0

    if-eqz v0, :cond_ad

    .line 22
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->m()V

    .line 23
    :cond_ad
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_ba

    .line 24
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->q()Z

    .line 25
    iput v1, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    .line 26
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->n()V

    .line 27
    :cond_ba
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->f()V

    .line 28
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    goto :goto_e9

    .line 29
    :cond_c1
    iput v0, p0, Lcom/google/android/material/slider/BaseSlider;->I:F

    .line 30
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->i()Z

    move-result v0

    if-eqz v0, :cond_ca

    goto :goto_e9

    .line 31
    :cond_ca
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 32
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->o()Z

    move-result v0

    if-nez v0, :cond_d8

    goto :goto_e9

    .line 33
    :cond_d8
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 34
    iput-boolean v3, p0, Lcom/google/android/material/slider/BaseSlider;->L:Z

    .line 35
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->q()Z

    .line 36
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->r()V

    .line 37
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 38
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->m()V

    .line 39
    :goto_e9
    iget-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider;->L:Z

    invoke-virtual {p0, v0}, Landroid/view/View;->setPressed(Z)V

    .line 40
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->J:Landroid/view/MotionEvent;

    return v3
.end method

.method public final p()Z
    .registers 3

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider;->V:Z

    if-nez v0, :cond_15

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_15

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Landroid/graphics/drawable/RippleDrawable;

    if-nez v0, :cond_13

    goto :goto_15

    :cond_13
    const/4 v0, 0x0

    goto :goto_16

    :cond_15
    :goto_15
    const/4 v0, 0x1

    :goto_16
    return v0
.end method

.method public final q()Z
    .registers 2

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/slider/BaseSlider;->getValueOfTouchPosition()F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/android/material/slider/BaseSlider;->d(F)Z

    move-result v0

    return v0
.end method

.method public final r()V
    .registers 7

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->p()Z

    move-result v0

    if-nez v0, :cond_3f

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    if-lez v0, :cond_3f

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 3
    instance-of v1, v0, Landroid/graphics/drawable/RippleDrawable;

    if-eqz v1, :cond_3f

    .line 4
    iget-object v1, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->Q:I

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {p0, v1}, Lcom/google/android/material/slider/BaseSlider;->c(F)F

    move-result v1

    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->U:I

    int-to-float v2, v2

    mul-float v1, v1, v2

    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->D:I

    int-to-float v2, v2

    add-float/2addr v1, v2

    float-to-int v1, v1

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->b()I

    move-result v2

    .line 6
    iget v3, p0, Lcom/google/android/material/slider/BaseSlider;->G:I

    sub-int v4, v1, v3

    sub-int v5, v2, v3

    add-int/2addr v1, v3

    add-int/2addr v2, v3

    invoke-static {v0, v4, v5, v1, v2}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;IIII)V

    :cond_3f
    return-void
.end method

.method public final s()V
    .registers 2

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider;->a0:Z

    if-eqz v0, :cond_16

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->u()V

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->v()V

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->t()V

    .line 5
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->w()V

    .line 6
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->x()V

    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider;->a0:Z

    :cond_16
    return-void
.end method

.method public setActiveThumbIndex(I)V
    .registers 2

    .line 1
    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->P:I

    return-void
.end method

.method public setEnabled(Z)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    if-eqz p1, :cond_7

    const/4 p1, 0x0

    goto :goto_8

    :cond_7
    const/4 p1, 0x2

    :goto_8
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    return-void
.end method

.method public setFocusedThumbIndex(I)V
    .registers 3

    if-ltz p1, :cond_15

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_15

    .line 2
    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->Q:I

    .line 3
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->n:Lcom/google/android/material/slider/BaseSlider$e;

    invoke-virtual {v0, p1}, Lb/j/a/a;->h(I)Z

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    return-void

    .line 5
    :cond_15
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "index out of range"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setHaloRadius(I)V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->G:I

    if-ne p1, v0, :cond_5

    return-void

    .line 2
    :cond_5
    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->G:I

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->p()Z

    move-result v0

    if-nez v0, :cond_1d

    instance-of v0, p1, Landroid/graphics/drawable/RippleDrawable;

    if-eqz v0, :cond_1d

    .line 5
    check-cast p1, Landroid/graphics/drawable/RippleDrawable;

    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->G:I

    invoke-static {p1, v0}, Lc/a/a/a/z/a;->a(Landroid/graphics/drawable/RippleDrawable;I)V

    return-void

    .line 6
    :cond_1d
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    return-void
.end method

.method public setHaloRadiusResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->setHaloRadius(I)V

    return-void
.end method

.method public setHaloTintList(Landroid/content/res/ColorStateList;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->b0:Landroid/content/res/ColorStateList;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    .line 2
    :cond_9
    iput-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->b0:Landroid/content/res/ColorStateList;

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->p()Z

    move-result v1

    if-nez v1, :cond_1f

    instance-of v1, v0, Landroid/graphics/drawable/RippleDrawable;

    if-eqz v1, :cond_1f

    .line 5
    check-cast v0, Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/RippleDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    return-void

    .line 6
    :cond_1f
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->k:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->a(Landroid/content/res/ColorStateList;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 7
    iget-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->k:Landroid/graphics/Paint;

    const/16 v0, 0x3f

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public setLabelBehavior(I)V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->B:I

    if-eq v0, p1, :cond_9

    .line 2
    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->B:I

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    :cond_9
    return-void
.end method

.method public setLabelFormatter(Lc/a/a/a/m0/c;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->K:Lc/a/a/a/m0/c;

    return-void
.end method

.method public setSeparationUnit(I)V
    .registers 2

    .line 1
    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->i0:I

    return-void
.end method

.method public setStepSize(F)V
    .registers 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    cmpg-float v1, p1, v1

    if-ltz v1, :cond_14

    .line 1
    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_13

    .line 2
    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    .line 3
    iput-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider;->a0:Z

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    :cond_13
    return-void

    .line 5
    :cond_14
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    .line 6
    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v2, v3

    iget p1, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    .line 7
    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v2, v0

    const/4 p1, 0x2

    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    .line 8
    invoke-static {v0}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, p1

    const-string p1, "The stepSize(%s) must be 0, or a factor of the valueFrom(%s)-valueTo(%s) range"

    .line 9
    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setThumbElevation(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->g0:Lc/a/a/a/l0/h;

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->b(F)V

    return-void
.end method

.method public setThumbElevationResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->setThumbElevation(F)V

    return-void
.end method

.method public setThumbRadius(I)V
    .registers 5

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->F:I

    if-ne p1, v0, :cond_5

    return-void

    .line 2
    :cond_5
    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->F:I

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->l()V

    .line 4
    iget-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->g0:Lc/a/a/a/l0/h;

    .line 5
    invoke-static {}, Lc/a/a/a/l0/m;->n()Lc/a/a/a/l0/m$b;

    move-result-object v0

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->F:I

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lc/a/a/a/l0/m$b;->a(IF)Lc/a/a/a/l0/m$b;

    invoke-virtual {v0}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object v0

    .line 6
    invoke-virtual {p1, v0}, Lc/a/a/a/l0/h;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    .line 7
    iget-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->g0:Lc/a/a/a/l0/h;

    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->F:I

    mul-int/lit8 v1, v0, 0x2

    mul-int/lit8 v0, v0, 0x2

    invoke-virtual {p1, v2, v2, v1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    return-void
.end method

.method public setThumbRadiusResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->setThumbRadius(I)V

    return-void
.end method

.method public setThumbStrokeColor(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->g0:Lc/a/a/a/l0/h;

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->b(Landroid/content/res/ColorStateList;)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    return-void
.end method

.method public setThumbStrokeColorResource(I)V
    .registers 3

    if-eqz p1, :cond_d

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->setThumbStrokeColor(Landroid/content/res/ColorStateList;)V

    :cond_d
    return-void
.end method

.method public setThumbStrokeWidth(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->g0:Lc/a/a/a/l0/h;

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->e(F)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    return-void
.end method

.method public setThumbStrokeWidthResource(I)V
    .registers 3

    if-eqz p1, :cond_d

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->setThumbStrokeWidth(F)V

    :cond_d
    return-void
.end method

.method public setThumbTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->g0:Lc/a/a/a/l0/h;

    invoke-virtual {v0}, Lc/a/a/a/l0/h;->h()Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    return-void

    .line 2
    :cond_d
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->g0:Lc/a/a/a/l0/h;

    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public setTickActiveTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->c0:Landroid/content/res/ColorStateList;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    .line 2
    :cond_9
    iput-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->c0:Landroid/content/res/ColorStateList;

    .line 3
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->m:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->a(Landroid/content/res/ColorStateList;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public setTickInactiveTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->d0:Landroid/content/res/ColorStateList;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    .line 2
    :cond_9
    iput-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->d0:Landroid/content/res/ColorStateList;

    .line 3
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->l:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->a(Landroid/content/res/ColorStateList;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public setTickTintList(Landroid/content/res/ColorStateList;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->setTickInactiveTintList(Landroid/content/res/ColorStateList;)V

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->setTickActiveTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setTickVisible(Z)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lcom/google/android/material/slider/BaseSlider;->T:Z

    if-eq v0, p1, :cond_9

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/slider/BaseSlider;->T:Z

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    :cond_9
    return-void
.end method

.method public setTrackActiveTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->e0:Landroid/content/res/ColorStateList;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    .line 2
    :cond_9
    iput-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->e0:Landroid/content/res/ColorStateList;

    .line 3
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->i:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->a(Landroid/content/res/ColorStateList;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public setTrackHeight(I)V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->C:I

    if-eq v0, p1, :cond_c

    .line 2
    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->C:I

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/slider/BaseSlider;->h()V

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    :cond_c
    return-void
.end method

.method public setTrackInactiveTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->f0:Landroid/content/res/ColorStateList;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    .line 2
    :cond_9
    iput-object p1, p0, Lcom/google/android/material/slider/BaseSlider;->f0:Landroid/content/res/ColorStateList;

    .line 3
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->h:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->a(Landroid/content/res/ColorStateList;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public setTrackTintList(Landroid/content/res/ColorStateList;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->setTrackInactiveTintList(Landroid/content/res/ColorStateList;)V

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/material/slider/BaseSlider;->setTrackActiveTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setValueFrom(F)V
    .registers 2

    .line 1
    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/slider/BaseSlider;->a0:Z

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    return-void
.end method

.method public setValueTo(F)V
    .registers 2

    .line 1
    iput p1, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/slider/BaseSlider;->a0:Z

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    return-void
.end method

.method public setValues(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {p0, v0}, Lcom/google/android/material/slider/BaseSlider;->setValuesInternal(Ljava/util/ArrayList;)V

    return-void
.end method

.method public varargs setValues([Ljava/lang/Float;)V
    .registers 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2
    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 3
    invoke-direct {p0, v0}, Lcom/google/android/material/slider/BaseSlider;->setValuesInternal(Ljava/util/ArrayList;)V

    return-void
.end method

.method public final t()V
    .registers 5

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_3a

    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    invoke-virtual {p0, v0}, Lcom/google/android/material/slider/BaseSlider;->f(F)Z

    move-result v0

    if-eqz v0, :cond_10

    goto :goto_3a

    .line 2
    :cond_10
    new-instance v0, Ljava/lang/IllegalStateException;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    .line 3
    invoke-static {v3}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    .line 4
    invoke-static {v3}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget v3, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    .line 5
    invoke-static {v3}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "The stepSize(%s) must be 0, or a factor of the valueFrom(%s)-valueTo(%s) range"

    .line 6
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3a
    :goto_3a
    return-void
.end method

.method public final u()V
    .registers 5

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    cmpl-float v0, v0, v1

    if-gez v0, :cond_9

    return-void

    .line 2
    :cond_9
    new-instance v0, Ljava/lang/IllegalStateException;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    .line 3
    invoke-static {v3}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    invoke-static {v3}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "valueFrom(%s) must be smaller than valueTo(%s)"

    .line 4
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final v()V
    .registers 5

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    cmpg-float v0, v0, v1

    if-lez v0, :cond_9

    return-void

    .line 2
    :cond_9
    new-instance v0, Ljava/lang/IllegalStateException;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    .line 3
    invoke-static {v3}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    invoke-static {v3}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "valueTo(%s) must be greater than valueFrom(%s)"

    .line 4
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final w()V
    .registers 9

    .line 1
    iget-object v0, p0, Lcom/google/android/material/slider/BaseSlider;->O:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_95

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    .line 2
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget v3, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x3

    cmpg-float v2, v2, v3

    if-ltz v2, :cond_6d

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iget v3, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    cmpl-float v2, v2, v3

    if-gtz v2, :cond_6d

    .line 3
    iget v2, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_6

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {p0, v2}, Lcom/google/android/material/slider/BaseSlider;->f(F)Z

    move-result v2

    if-eqz v2, :cond_3c

    goto :goto_6

    .line 4
    :cond_3c
    new-instance v0, Ljava/lang/IllegalStateException;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    .line 5
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v6

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    .line 6
    invoke-static {v1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v5

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    .line 7
    invoke-static {v1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v4

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    .line 8
    invoke-static {v1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v7

    const-string v1, "Value(%s) must be equal to valueFrom(%s) plus a multiple of stepSize(%s) when using stepSize(%s)"

    .line 9
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 10
    :cond_6d
    new-instance v0, Ljava/lang/IllegalStateException;

    new-array v2, v7, [Ljava/lang/Object;

    .line 11
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v6

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    .line 12
    invoke-static {v1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v5

    iget v1, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    .line 13
    invoke-static {v1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v4

    const-string v1, "Slider value(%s) must be greater or equal to valueFrom(%s), and lower or equal to valueTo(%s)"

    .line 14
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_95
    return-void
.end method

.method public final x()V
    .registers 9

    .line 1
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->R:F

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-nez v1, :cond_8

    return-void

    :cond_8
    float-to-int v1, v0

    int-to-float v1, v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    const-string v5, "Floating point value used for %s(%s). Using floats can have rounding errors which may result in incorrect values. Instead, consider using integers with a custom LabelFormatter to display the  value correctly."

    cmpl-float v1, v1, v0

    if-eqz v1, :cond_28

    .line 2
    sget-object v1, Lcom/google/android/material/slider/BaseSlider;->j0:Ljava/lang/String;

    new-array v6, v4, [Ljava/lang/Object;

    const-string v7, "stepSize"

    aput-object v7, v6, v3

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_28
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->M:F

    float-to-int v1, v0

    int-to-float v1, v1

    cmpl-float v1, v1, v0

    if-eqz v1, :cond_45

    .line 4
    sget-object v1, Lcom/google/android/material/slider/BaseSlider;->j0:Ljava/lang/String;

    new-array v6, v4, [Ljava/lang/Object;

    const-string v7, "valueFrom"

    aput-object v7, v6, v3

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    aput-object v0, v6, v2

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 5
    :cond_45
    iget v0, p0, Lcom/google/android/material/slider/BaseSlider;->N:F

    float-to-int v1, v0

    int-to-float v1, v1

    cmpl-float v1, v1, v0

    if-eqz v1, :cond_62

    .line 6
    sget-object v1, Lcom/google/android/material/slider/BaseSlider;->j0:Ljava/lang/String;

    new-array v4, v4, [Ljava/lang/Object;

    const-string v6, "valueTo"

    aput-object v6, v4, v3

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    aput-object v0, v4, v2

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_62
    return-void
.end method
