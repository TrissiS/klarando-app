.class public abstract Lc/a/a/a/c0/b;
.super Ljava/lang/Object;
.source "BaseMotionStrategy.java"

# interfaces
.implements Lc/a/a/a/c0/f;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

.field public final c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/animation/Animator$AnimatorListener;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Lc/a/a/a/c0/a;

.field public e:Lc/a/a/a/m/h;

.field public f:Lc/a/a/a/m/h;


# direct methods
.method public constructor <init>(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;Lc/a/a/a/c0/a;)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lc/a/a/a/c0/b;->c:Ljava/util/ArrayList;

    .line 3
    iput-object p1, p0, Lc/a/a/a/c0/b;->b:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    .line 4
    invoke-virtual {p1}, Landroid/widget/Button;->getContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lc/a/a/a/c0/b;->a:Landroid/content/Context;

    .line 5
    iput-object p2, p0, Lc/a/a/a/c0/b;->d:Lc/a/a/a/c0/a;

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/c0/b;)Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/c0/b;->b:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    return-object p0
.end method


# virtual methods
.method public a()Lc/a/a/a/m/h;
    .registers 2

    .line 3
    iget-object v0, p0, Lc/a/a/a/c0/b;->f:Lc/a/a/a/m/h;

    return-object v0
.end method

.method public final a(Lc/a/a/a/m/h;)V
    .registers 2

    .line 2
    iput-object p1, p0, Lc/a/a/a/c0/b;->f:Lc/a/a/a/m/h;

    return-void
.end method

.method public b()Landroid/animation/AnimatorSet;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/c0/b;->i()Lc/a/a/a/m/h;

    move-result-object v0

    invoke-virtual {p0, v0}, Lc/a/a/a/c0/b;->b(Lc/a/a/a/m/h;)Landroid/animation/AnimatorSet;

    move-result-object v0

    return-object v0
.end method

.method public b(Lc/a/a/a/m/h;)Landroid/animation/AnimatorSet;
    .registers 8

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "opacity"

    .line 3
    invoke-virtual {p1, v1}, Lc/a/a/a/m/h;->c(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 4
    iget-object v2, p0, Lc/a/a/a/c0/b;->b:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    invoke-virtual {p1, v1, v2, v3}, Lc/a/a/a/m/h;->a(Ljava/lang/String;Ljava/lang/Object;Landroid/util/Property;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_18
    const-string v1, "scale"

    .line 5
    invoke-virtual {p1, v1}, Lc/a/a/a/m/h;->c(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_36

    .line 6
    iget-object v2, p0, Lc/a/a/a/c0/b;->b:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    sget-object v3, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    invoke-virtual {p1, v1, v2, v3}, Lc/a/a/a/m/h;->a(Ljava/lang/String;Ljava/lang/Object;Landroid/util/Property;)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 7
    iget-object v2, p0, Lc/a/a/a/c0/b;->b:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    sget-object v3, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    invoke-virtual {p1, v1, v2, v3}, Lc/a/a/a/m/h;->a(Ljava/lang/String;Ljava/lang/Object;Landroid/util/Property;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_36
    const-string v1, "width"

    .line 8
    invoke-virtual {p1, v1}, Lc/a/a/a/m/h;->c(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_49

    .line 9
    iget-object v2, p0, Lc/a/a/a/c0/b;->b:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    sget-object v3, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->O:Landroid/util/Property;

    invoke-virtual {p1, v1, v2, v3}, Lc/a/a/a/m/h;->a(Ljava/lang/String;Ljava/lang/Object;Landroid/util/Property;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_49
    const-string v1, "height"

    .line 10
    invoke-virtual {p1, v1}, Lc/a/a/a/m/h;->c(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5c

    .line 11
    iget-object v2, p0, Lc/a/a/a/c0/b;->b:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    sget-object v3, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->P:Landroid/util/Property;

    invoke-virtual {p1, v1, v2, v3}, Lc/a/a/a/m/h;->a(Ljava/lang/String;Ljava/lang/Object;Landroid/util/Property;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_5c
    const-string v1, "paddingStart"

    .line 12
    invoke-virtual {p1, v1}, Lc/a/a/a/m/h;->c(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6f

    .line 13
    iget-object v2, p0, Lc/a/a/a/c0/b;->b:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    sget-object v3, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->Q:Landroid/util/Property;

    .line 14
    invoke-virtual {p1, v1, v2, v3}, Lc/a/a/a/m/h;->a(Ljava/lang/String;Ljava/lang/Object;Landroid/util/Property;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 15
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6f
    const-string v1, "paddingEnd"

    .line 16
    invoke-virtual {p1, v1}, Lc/a/a/a/m/h;->c(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_82

    .line 17
    iget-object v2, p0, Lc/a/a/a/c0/b;->b:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    sget-object v3, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->R:Landroid/util/Property;

    invoke-virtual {p1, v1, v2, v3}, Lc/a/a/a/m/h;->a(Ljava/lang/String;Ljava/lang/Object;Landroid/util/Property;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_82
    const-string v1, "labelOpacity"

    .line 18
    invoke-virtual {p1, v1}, Lc/a/a/a/m/h;->c(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9c

    .line 19
    iget-object v2, p0, Lc/a/a/a/c0/b;->b:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    new-instance v3, Lc/a/a/a/c0/b$a;

    const-class v4, Ljava/lang/Float;

    const-string v5, "LABEL_OPACITY_PROPERTY"

    invoke-direct {v3, p0, v4, v5}, Lc/a/a/a/c0/b$a;-><init>(Lc/a/a/a/c0/b;Ljava/lang/Class;Ljava/lang/String;)V

    .line 20
    invoke-virtual {p1, v1, v2, v3}, Lc/a/a/a/m/h;->a(Ljava/lang/String;Ljava/lang/Object;Landroid/util/Property;)Landroid/animation/ObjectAnimator;

    move-result-object p1

    .line 21
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    :cond_9c
    new-instance p1, Landroid/animation/AnimatorSet;

    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 23
    invoke-static {p1, v0}, Lc/a/a/a/m/b;->a(Landroid/animation/AnimatorSet;Ljava/util/List;)V

    return-object p1
.end method

.method public c()V
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/b;->d:Lc/a/a/a/c0/a;

    invoke-virtual {v0}, Lc/a/a/a/c0/a;->b()V

    return-void
.end method

.method public d()V
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/b;->d:Lc/a/a/a/c0/a;

    invoke-virtual {v0}, Lc/a/a/a/c0/a;->b()V

    return-void
.end method

.method public final e()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/animation/Animator$AnimatorListener;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/b;->c:Ljava/util/ArrayList;

    return-object v0
.end method

.method public final i()Lc/a/a/a/m/h;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/b;->f:Lc/a/a/a/m/h;

    if-eqz v0, :cond_5

    return-object v0

    .line 2
    :cond_5
    iget-object v0, p0, Lc/a/a/a/c0/b;->e:Lc/a/a/a/m/h;

    if-nez v0, :cond_15

    .line 3
    iget-object v0, p0, Lc/a/a/a/c0/b;->a:Landroid/content/Context;

    invoke-interface {p0}, Lc/a/a/a/c0/f;->g()I

    move-result v1

    invoke-static {v0, v1}, Lc/a/a/a/m/h;->a(Landroid/content/Context;I)Lc/a/a/a/m/h;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/c0/b;->e:Lc/a/a/a/m/h;

    .line 4
    :cond_15
    iget-object v0, p0, Lc/a/a/a/c0/b;->e:Lc/a/a/a/m/h;

    invoke-static {v0}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v0, Lc/a/a/a/m/h;

    return-object v0
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/b;->d:Lc/a/a/a/c0/a;

    invoke-virtual {v0, p1}, Lc/a/a/a/c0/a;->a(Landroid/animation/Animator;)V

    return-void
.end method
