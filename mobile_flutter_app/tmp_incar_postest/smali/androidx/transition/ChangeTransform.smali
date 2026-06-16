.class public Landroidx/transition/ChangeTransform;
.super Landroidx/transition/Transition;
.source "ChangeTransform.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/transition/ChangeTransform$e;,
        Landroidx/transition/ChangeTransform$d;,
        Landroidx/transition/ChangeTransform$f;
    }
.end annotation


# static fields
.field public static final T:[Ljava/lang/String;

.field public static final U:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroidx/transition/ChangeTransform$e;",
            "[F>;"
        }
    .end annotation
.end field

.field public static final V:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property<",
            "Landroidx/transition/ChangeTransform$e;",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field public static final W:Z


# instance fields
.field public Q:Z

.field public R:Z

.field public S:Landroid/graphics/Matrix;


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    const-string v0, "android:changeTransform:matrix"

    const-string v1, "android:changeTransform:transforms"

    const-string v2, "android:changeTransform:parentMatrix"

    .line 1
    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/transition/ChangeTransform;->T:[Ljava/lang/String;

    .line 2
    new-instance v0, Landroidx/transition/ChangeTransform$a;

    const-class v1, [F

    const-string v2, "nonTranslations"

    invoke-direct {v0, v1, v2}, Landroidx/transition/ChangeTransform$a;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Landroidx/transition/ChangeTransform;->U:Landroid/util/Property;

    .line 3
    new-instance v0, Landroidx/transition/ChangeTransform$b;

    const-class v1, Landroid/graphics/PointF;

    const-string v2, "translations"

    invoke-direct {v0, v1, v2}, Landroidx/transition/ChangeTransform$b;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Landroidx/transition/ChangeTransform;->V:Landroid/util/Property;

    .line 4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_2a

    const/4 v0, 0x1

    goto :goto_2b

    :cond_2a
    const/4 v0, 0x0

    :goto_2b
    sput-boolean v0, Landroidx/transition/ChangeTransform;->W:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Landroidx/transition/Transition;-><init>()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/transition/ChangeTransform;->Q:Z

    .line 3
    iput-boolean v0, p0, Landroidx/transition/ChangeTransform;->R:Z

    .line 4
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Landroidx/transition/ChangeTransform;->S:Landroid/graphics/Matrix;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/transition/Transition;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Landroidx/transition/ChangeTransform;->Q:Z

    .line 7
    iput-boolean v0, p0, Landroidx/transition/ChangeTransform;->R:Z

    .line 8
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Landroidx/transition/ChangeTransform;->S:Landroid/graphics/Matrix;

    .line 9
    sget-object v1, Lb/s/t;->e:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 10
    check-cast p2, Lorg/xmlpull/v1/XmlPullParser;

    const-string v1, "reparentWithOverlay"

    invoke-static {p1, p2, v1, v0, v0}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IZ)Z

    move-result v1

    iput-boolean v1, p0, Landroidx/transition/ChangeTransform;->Q:Z

    const-string v1, "reparent"

    const/4 v2, 0x0

    .line 11
    invoke-static {p1, p2, v1, v2, v0}, Lb/h/e/c/g;->a(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IZ)Z

    move-result p2

    iput-boolean p2, p0, Landroidx/transition/ChangeTransform;->R:Z

    .line 12
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public static a(Landroid/view/View;FFFFFFFF)V
    .registers 9

    .line 40
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 41
    invoke-virtual {p0, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 42
    invoke-static {p0, p3}, Lb/h/m/y;->b(Landroid/view/View;F)V

    .line 43
    invoke-virtual {p0, p4}, Landroid/view/View;->setScaleX(F)V

    .line 44
    invoke-virtual {p0, p5}, Landroid/view/View;->setScaleY(F)V

    .line 45
    invoke-virtual {p0, p6}, Landroid/view/View;->setRotationX(F)V

    .line 46
    invoke-virtual {p0, p7}, Landroid/view/View;->setRotationY(F)V

    .line 47
    invoke-virtual {p0, p8}, Landroid/view/View;->setRotation(F)V

    return-void
.end method

.method public static f(Landroid/view/View;)V
    .registers 10

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v0, p0

    .line 1
    invoke-static/range {v0 .. v8}, Landroidx/transition/ChangeTransform;->a(Landroid/view/View;FFFFFFFF)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/ViewGroup;Lb/s/y;Lb/s/y;)Landroid/animation/Animator;
    .registers 9

    if-eqz p2, :cond_79

    if-eqz p3, :cond_79

    .line 2
    iget-object v0, p2, Lb/s/y;->a:Ljava/util/Map;

    const-string v1, "android:changeTransform:parent"

    .line 3
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_79

    iget-object v0, p3, Lb/s/y;->a:Ljava/util/Map;

    .line 4
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    goto :goto_79

    .line 5
    :cond_17
    iget-object v0, p2, Lb/s/y;->a:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 6
    iget-object v2, p3, Lb/s/y;->a:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 7
    iget-boolean v2, p0, Landroidx/transition/ChangeTransform;->R:Z

    if-eqz v2, :cond_33

    invoke-virtual {p0, v0, v1}, Landroidx/transition/ChangeTransform;->a(Landroid/view/ViewGroup;Landroid/view/ViewGroup;)Z

    move-result v1

    if-nez v1, :cond_33

    const/4 v1, 0x1

    goto :goto_34

    :cond_33
    const/4 v1, 0x0

    .line 8
    :goto_34
    iget-object v2, p2, Lb/s/y;->a:Ljava/util/Map;

    const-string v3, "android:changeTransform:intermediateMatrix"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Matrix;

    if-eqz v2, :cond_47

    .line 9
    iget-object v3, p2, Lb/s/y;->a:Ljava/util/Map;

    const-string v4, "android:changeTransform:matrix"

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    :cond_47
    iget-object v2, p2, Lb/s/y;->a:Ljava/util/Map;

    const-string v3, "android:changeTransform:intermediateParentMatrix"

    .line 11
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Matrix;

    if-eqz v2, :cond_5a

    .line 12
    iget-object v3, p2, Lb/s/y;->a:Ljava/util/Map;

    const-string v4, "android:changeTransform:parentMatrix"

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5a
    if-eqz v1, :cond_5f

    .line 13
    invoke-virtual {p0, p2, p3}, Landroidx/transition/ChangeTransform;->b(Lb/s/y;Lb/s/y;)V

    .line 14
    :cond_5f
    invoke-virtual {p0, p2, p3, v1}, Landroidx/transition/ChangeTransform;->a(Lb/s/y;Lb/s/y;Z)Landroid/animation/ObjectAnimator;

    move-result-object v2

    if-eqz v1, :cond_6f

    if-eqz v2, :cond_6f

    .line 15
    iget-boolean v1, p0, Landroidx/transition/ChangeTransform;->Q:Z

    if-eqz v1, :cond_6f

    .line 16
    invoke-virtual {p0, p1, p2, p3}, Landroidx/transition/ChangeTransform;->b(Landroid/view/ViewGroup;Lb/s/y;Lb/s/y;)V

    goto :goto_78

    .line 17
    :cond_6f
    sget-boolean p1, Landroidx/transition/ChangeTransform;->W:Z

    if-nez p1, :cond_78

    .line 18
    iget-object p1, p2, Lb/s/y;->b:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    :cond_78
    :goto_78
    return-object v2

    :cond_79
    :goto_79
    const/4 p1, 0x0

    return-object p1
.end method

.method public final a(Lb/s/y;Lb/s/y;Z)Landroid/animation/ObjectAnimator;
    .registers 16

    .line 19
    iget-object p1, p1, Lb/s/y;->a:Ljava/util/Map;

    const-string v0, "android:changeTransform:matrix"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Matrix;

    .line 20
    iget-object v1, p2, Lb/s/y;->a:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Matrix;

    if-nez p1, :cond_16

    .line 21
    sget-object p1, Lb/s/l;->a:Landroid/graphics/Matrix;

    :cond_16
    if-nez v0, :cond_1a

    .line 22
    sget-object v0, Lb/s/l;->a:Landroid/graphics/Matrix;

    :cond_1a
    move-object v4, v0

    .line 23
    invoke-virtual {p1, v4}, Landroid/graphics/Matrix;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_23

    const/4 p1, 0x0

    return-object p1

    .line 24
    :cond_23
    iget-object v0, p2, Lb/s/y;->a:Ljava/util/Map;

    const-string v1, "android:changeTransform:transforms"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroidx/transition/ChangeTransform$f;

    .line 25
    iget-object v5, p2, Lb/s/y;->b:Landroid/view/View;

    .line 26
    invoke-static {v5}, Landroidx/transition/ChangeTransform;->f(Landroid/view/View;)V

    const/16 p2, 0x9

    new-array v0, p2, [F

    .line 27
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    new-array p1, p2, [F

    .line 28
    invoke-virtual {v4, p1}, Landroid/graphics/Matrix;->getValues([F)V

    .line 29
    new-instance v7, Landroidx/transition/ChangeTransform$e;

    invoke-direct {v7, v5, v0}, Landroidx/transition/ChangeTransform$e;-><init>(Landroid/view/View;[F)V

    .line 30
    sget-object v1, Landroidx/transition/ChangeTransform;->U:Landroid/util/Property;

    new-instance v2, Lb/s/d;

    new-array p2, p2, [F

    invoke-direct {v2, p2}, Lb/s/d;-><init>([F)V

    const/4 p2, 0x2

    new-array v3, p2, [[F

    const/4 v8, 0x0

    aput-object v0, v3, v8

    const/4 v9, 0x1

    aput-object p1, v3, v9

    invoke-static {v1, v2, v3}, Landroid/animation/PropertyValuesHolder;->ofObject(Landroid/util/Property;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    .line 31
    invoke-virtual {p0}, Landroidx/transition/Transition;->h()Landroidx/transition/PathMotion;

    move-result-object v2

    aget v3, v0, p2

    const/4 v10, 0x5

    aget v0, v0, v10

    aget v11, p1, p2

    aget p1, p1, v10

    invoke-virtual {v2, v3, v0, v11, p1}, Landroidx/transition/PathMotion;->a(FFFF)Landroid/graphics/Path;

    move-result-object p1

    .line 32
    sget-object v0, Landroidx/transition/ChangeTransform;->V:Landroid/util/Property;

    invoke-static {v0, p1}, Lb/s/o;->a(Landroid/util/Property;Landroid/graphics/Path;)Landroid/animation/PropertyValuesHolder;

    move-result-object p1

    new-array p2, p2, [Landroid/animation/PropertyValuesHolder;

    aput-object v1, p2, v8

    aput-object p1, p2, v9

    .line 33
    invoke-static {v7, p2}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object p1

    .line 34
    new-instance p2, Landroidx/transition/ChangeTransform$c;

    move-object v1, p2

    move-object v2, p0

    move v3, p3

    invoke-direct/range {v1 .. v7}, Landroidx/transition/ChangeTransform$c;-><init>(Landroidx/transition/ChangeTransform;ZLandroid/graphics/Matrix;Landroid/view/View;Landroidx/transition/ChangeTransform$f;Landroidx/transition/ChangeTransform$e;)V

    .line 35
    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 36
    invoke-static {p1, p2}, Lb/s/a;->a(Landroid/animation/Animator;Landroid/animation/AnimatorListenerAdapter;)V

    return-object p1
.end method

.method public a(Lb/s/y;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Landroidx/transition/ChangeTransform;->d(Lb/s/y;)V

    return-void
.end method

.method public final a(Landroid/view/ViewGroup;Landroid/view/ViewGroup;)Z
    .registers 6

    .line 37
    invoke-virtual {p0, p1}, Landroidx/transition/Transition;->b(Landroid/view/View;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1a

    invoke-virtual {p0, p2}, Landroidx/transition/Transition;->b(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_f

    goto :goto_1a

    .line 38
    :cond_f
    invoke-virtual {p0, p1, v1}, Landroidx/transition/Transition;->b(Landroid/view/View;Z)Lb/s/y;

    move-result-object p1

    if-eqz p1, :cond_1f

    .line 39
    iget-object p1, p1, Lb/s/y;->b:Landroid/view/View;

    if-ne p2, p1, :cond_1d

    goto :goto_1e

    :cond_1a
    :goto_1a
    if-ne p1, p2, :cond_1d

    goto :goto_1e

    :cond_1d
    const/4 v1, 0x0

    :goto_1e
    move v2, v1

    :cond_1f
    return v2
.end method

.method public final b(Landroid/view/ViewGroup;Lb/s/y;Lb/s/y;)V
    .registers 7

    .line 1
    iget-object v0, p3, Lb/s/y;->b:Landroid/view/View;

    .line 2
    iget-object v1, p3, Lb/s/y;->a:Ljava/util/Map;

    const-string v2, "android:changeTransform:parentMatrix"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Matrix;

    .line 3
    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 4
    invoke-static {p1, v2}, Lb/s/j0;->c(Landroid/view/View;Landroid/graphics/Matrix;)V

    .line 5
    invoke-static {v0, p1, v2}, Lb/s/j;->a(Landroid/view/View;Landroid/view/ViewGroup;Landroid/graphics/Matrix;)Lb/s/f;

    move-result-object p1

    if-nez p1, :cond_1b

    return-void

    .line 6
    :cond_1b
    iget-object v1, p2, Lb/s/y;->a:Ljava/util/Map;

    const-string v2, "android:changeTransform:parent"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iget-object v2, p2, Lb/s/y;->b:Landroid/view/View;

    invoke-interface {p1, v1, v2}, Lb/s/f;->a(Landroid/view/ViewGroup;Landroid/view/View;)V

    move-object v1, p0

    .line 7
    :goto_2b
    iget-object v2, v1, Landroidx/transition/Transition;->y:Landroidx/transition/TransitionSet;

    if-eqz v2, :cond_31

    move-object v1, v2

    goto :goto_2b

    .line 8
    :cond_31
    new-instance v2, Landroidx/transition/ChangeTransform$d;

    invoke-direct {v2, v0, p1}, Landroidx/transition/ChangeTransform$d;-><init>(Landroid/view/View;Lb/s/f;)V

    .line 9
    invoke-virtual {v1, v2}, Landroidx/transition/Transition;->a(Landroidx/transition/Transition$f;)Landroidx/transition/Transition;

    .line 10
    sget-boolean p1, Landroidx/transition/ChangeTransform;->W:Z

    if-eqz p1, :cond_4c

    .line 11
    iget-object p1, p2, Lb/s/y;->b:Landroid/view/View;

    iget-object p2, p3, Lb/s/y;->b:Landroid/view/View;

    if-eq p1, p2, :cond_47

    const/4 p2, 0x0

    .line 12
    invoke-static {p1, p2}, Lb/s/j0;->a(Landroid/view/View;F)V

    :cond_47
    const/high16 p1, 0x3f800000    # 1.0f

    .line 13
    invoke-static {v0, p1}, Lb/s/j0;->a(Landroid/view/View;F)V

    :cond_4c
    return-void
.end method

.method public final b(Lb/s/y;Lb/s/y;)V
    .registers 7

    .line 14
    iget-object v0, p2, Lb/s/y;->a:Ljava/util/Map;

    const-string v1, "android:changeTransform:parentMatrix"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Matrix;

    .line 15
    iget-object p2, p2, Lb/s/y;->b:Landroid/view/View;

    sget v2, Lb/s/p;->parent_matrix:I

    invoke-virtual {p2, v2, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 16
    iget-object p2, p0, Landroidx/transition/ChangeTransform;->S:Landroid/graphics/Matrix;

    .line 17
    invoke-virtual {p2}, Landroid/graphics/Matrix;->reset()V

    .line 18
    invoke-virtual {v0, p2}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 19
    iget-object v0, p1, Lb/s/y;->a:Ljava/util/Map;

    const-string v2, "android:changeTransform:matrix"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Matrix;

    if-nez v0, :cond_2f

    .line 20
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 21
    iget-object v3, p1, Lb/s/y;->a:Ljava/util/Map;

    invoke-interface {v3, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    :cond_2f
    iget-object p1, p1, Lb/s/y;->a:Ljava/util/Map;

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Matrix;

    .line 23
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 24
    invoke-virtual {v0, p2}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    return-void
.end method

.method public c(Lb/s/y;)V
    .registers 3

    .line 1
    invoke-virtual {p0, p1}, Landroidx/transition/ChangeTransform;->d(Lb/s/y;)V

    .line 2
    sget-boolean v0, Landroidx/transition/ChangeTransform;->W:Z

    if-nez v0, :cond_14

    .line 3
    iget-object v0, p1, Lb/s/y;->b:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object p1, p1, Lb/s/y;->b:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    :cond_14
    return-void
.end method

.method public final d(Lb/s/y;)V
    .registers 6

    .line 1
    iget-object v0, p1, Lb/s/y;->b:Landroid/view/View;

    .line 2
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_b

    return-void

    .line 3
    :cond_b
    iget-object v1, p1, Lb/s/y;->a:Ljava/util/Map;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    const-string v3, "android:changeTransform:parent"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    new-instance v1, Landroidx/transition/ChangeTransform$f;

    invoke-direct {v1, v0}, Landroidx/transition/ChangeTransform$f;-><init>(Landroid/view/View;)V

    .line 5
    iget-object v2, p1, Lb/s/y;->a:Ljava/util/Map;

    const-string v3, "android:changeTransform:transforms"

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    invoke-virtual {v0}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    if-eqz v1, :cond_35

    .line 7
    invoke-virtual {v1}, Landroid/graphics/Matrix;->isIdentity()Z

    move-result v2

    if-eqz v2, :cond_2f

    goto :goto_35

    .line 8
    :cond_2f
    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    goto :goto_36

    :cond_35
    :goto_35
    const/4 v2, 0x0

    .line 9
    :goto_36
    iget-object v1, p1, Lb/s/y;->a:Ljava/util/Map;

    const-string v3, "android:changeTransform:matrix"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    iget-boolean v1, p0, Landroidx/transition/ChangeTransform;->R:Z

    if-eqz v1, :cond_7f

    .line 11
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 13
    invoke-static {v2, v1}, Lb/s/j0;->b(Landroid/view/View;Landroid/graphics/Matrix;)V

    .line 14
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v3

    neg-int v3, v3

    int-to-float v3, v3

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getScrollY()I

    move-result v2

    neg-int v2, v2

    int-to-float v2, v2

    invoke-virtual {v1, v3, v2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 15
    iget-object v2, p1, Lb/s/y;->a:Ljava/util/Map;

    const-string v3, "android:changeTransform:parentMatrix"

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    iget-object v1, p1, Lb/s/y;->a:Ljava/util/Map;

    sget v2, Lb/s/p;->transition_transform:I

    .line 17
    invoke-virtual {v0, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "android:changeTransform:intermediateMatrix"

    .line 18
    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    iget-object p1, p1, Lb/s/y;->a:Ljava/util/Map;

    sget v1, Lb/s/p;->parent_matrix:I

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "android:changeTransform:intermediateParentMatrix"

    .line 21
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7f
    return-void
.end method

.method public o()[Ljava/lang/String;
    .registers 2

    .line 1
    sget-object v0, Landroidx/transition/ChangeTransform;->T:[Ljava/lang/String;

    return-object v0
.end method
