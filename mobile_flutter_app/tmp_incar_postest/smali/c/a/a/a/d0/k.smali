.class public Lc/a/a/a/d0/k;
.super Landroidx/transition/Transition;
.source "TextScale.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Landroidx/transition/Transition;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/ViewGroup;Lb/s/y;Lb/s/y;)Landroid/animation/Animator;
    .registers 8

    const/4 p1, 0x0

    if-eqz p2, :cond_59

    if-eqz p3, :cond_59

    .line 2
    iget-object v0, p2, Lb/s/y;->b:Landroid/view/View;

    instance-of v0, v0, Landroid/widget/TextView;

    if-eqz v0, :cond_59

    iget-object v0, p3, Lb/s/y;->b:Landroid/view/View;

    instance-of v1, v0, Landroid/widget/TextView;

    if-nez v1, :cond_12

    goto :goto_59

    .line 3
    :cond_12
    check-cast v0, Landroid/widget/TextView;

    .line 4
    iget-object p2, p2, Lb/s/y;->a:Ljava/util/Map;

    .line 5
    iget-object p3, p3, Lb/s/y;->a:Ljava/util/Map;

    const-string v1, "android:textscale:scale"

    .line 6
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const/high16 v3, 0x3f800000    # 1.0f

    if-eqz v2, :cond_2d

    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p2

    goto :goto_2f

    :cond_2d
    const/high16 p2, 0x3f800000    # 1.0f

    .line 7
    :goto_2f
    invoke-interface {p3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_3f

    invoke-interface {p3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Float;

    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    :cond_3f
    cmpl-float p3, p2, v3

    if-nez p3, :cond_44

    return-object p1

    :cond_44
    const/4 p1, 0x2

    new-array p1, p1, [F

    const/4 p3, 0x0

    aput p2, p1, p3

    const/4 p2, 0x1

    aput v3, p1, p2

    .line 8
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    .line 9
    new-instance p2, Lc/a/a/a/d0/k$a;

    invoke-direct {p2, p0, v0}, Lc/a/a/a/d0/k$a;-><init>(Lc/a/a/a/d0/k;Landroid/widget/TextView;)V

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    :cond_59
    :goto_59
    return-object p1
.end method

.method public a(Lb/s/y;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/k;->d(Lb/s/y;)V

    return-void
.end method

.method public c(Lb/s/y;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/k;->d(Lb/s/y;)V

    return-void
.end method

.method public final d(Lb/s/y;)V
    .registers 4

    .line 1
    iget-object v0, p1, Lb/s/y;->b:Landroid/view/View;

    instance-of v1, v0, Landroid/widget/TextView;

    if-eqz v1, :cond_17

    .line 2
    check-cast v0, Landroid/widget/TextView;

    .line 3
    iget-object p1, p1, Lb/s/y;->a:Ljava/util/Map;

    invoke-virtual {v0}, Landroid/widget/TextView;->getScaleX()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    const-string v1, "android:textscale:scale"

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_17
    return-void
.end method
