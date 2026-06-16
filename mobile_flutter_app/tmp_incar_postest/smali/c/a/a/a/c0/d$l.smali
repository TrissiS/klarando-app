.class public abstract Lc/a/a/a/c0/d$l;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FloatingActionButtonImpl.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/c0/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401
    name = "l"
.end annotation


# instance fields
.field public a:Z

.field public b:F

.field public c:F

.field public final synthetic d:Lc/a/a/a/c0/d;


# direct methods
.method public constructor <init>(Lc/a/a/a/c0/d;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/c0/d$l;->d:Lc/a/a/a/c0/d;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lc/a/a/a/c0/d;Lc/a/a/a/c0/d$a;)V
    .registers 3

    .line 2
    invoke-direct {p0, p1}, Lc/a/a/a/c0/d$l;-><init>(Lc/a/a/a/c0/d;)V

    return-void
.end method


# virtual methods
.method public abstract a()F
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lc/a/a/a/c0/d$l;->d:Lc/a/a/a/c0/d;

    iget v0, p0, Lc/a/a/a/c0/d$l;->c:F

    float-to-int v0, v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Lc/a/a/a/c0/d;->e(F)V

    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lc/a/a/a/c0/d$l;->a:Z

    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 5

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/c0/d$l;->a:Z

    if-nez v0, :cond_1b

    .line 2
    iget-object v0, p0, Lc/a/a/a/c0/d$l;->d:Lc/a/a/a/c0/d;

    iget-object v0, v0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    if-nez v0, :cond_c

    const/4 v0, 0x0

    goto :goto_10

    :cond_c
    invoke-virtual {v0}, Lc/a/a/a/l0/h;->g()F

    move-result v0

    :goto_10
    iput v0, p0, Lc/a/a/a/c0/d$l;->b:F

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/c0/d$l;->a()F

    move-result v0

    iput v0, p0, Lc/a/a/a/c0/d$l;->c:F

    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Lc/a/a/a/c0/d$l;->a:Z

    .line 5
    :cond_1b
    iget-object v0, p0, Lc/a/a/a/c0/d$l;->d:Lc/a/a/a/c0/d;

    iget v1, p0, Lc/a/a/a/c0/d$l;->b:F

    iget v2, p0, Lc/a/a/a/c0/d$l;->c:F

    sub-float/2addr v2, v1

    .line 6
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result p1

    mul-float v2, v2, p1

    add-float/2addr v1, v2

    float-to-int p1, v1

    int-to-float p1, p1

    .line 7
    invoke-virtual {v0, p1}, Lc/a/a/a/c0/d;->e(F)V

    return-void
.end method
