.class public Lc/a/a/a/h0/m$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "LinearIndeterminateDisjointAnimatorDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/h0/m;->g()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/h0/m;


# direct methods
.method public constructor <init>(Lc/a/a/a/h0/m;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/h0/m$a;->a:Lc/a/a/a/h0/m;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/h0/m$a;->a:Lc/a/a/a/h0/m;

    invoke-static {p1}, Lc/a/a/a/h0/m;->c(Lc/a/a/a/h0/m;)Z

    move-result p1

    if-eqz p1, :cond_24

    .line 3
    iget-object p1, p0, Lc/a/a/a/h0/m$a;->a:Lc/a/a/a/h0/m;

    invoke-static {p1}, Lc/a/a/a/h0/m;->d(Lc/a/a/a/h0/m;)Landroid/animation/ObjectAnimator;

    move-result-object p1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 4
    iget-object p1, p0, Lc/a/a/a/h0/m$a;->a:Lc/a/a/a/h0/m;

    iget-object v0, p1, Lc/a/a/a/h0/m;->k:Lb/t/a/a/b$a;

    iget-object p1, p1, Lc/a/a/a/h0/i;->a:Lc/a/a/a/h0/j;

    invoke-virtual {v0, p1}, Lb/t/a/a/b$a;->a(Landroid/graphics/drawable/Drawable;)V

    .line 5
    iget-object p1, p0, Lc/a/a/a/h0/m$a;->a:Lc/a/a/a/h0/m;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lc/a/a/a/h0/m;->b(Lc/a/a/a/h0/m;Z)Z

    :cond_24
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .registers 5

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationRepeat(Landroid/animation/Animator;)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/h0/m$a;->a:Lc/a/a/a/h0/m;

    invoke-static {p1}, Lc/a/a/a/h0/m;->a(Lc/a/a/a/h0/m;)I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iget-object v2, p0, Lc/a/a/a/h0/m$a;->a:Lc/a/a/a/h0/m;

    invoke-static {v2}, Lc/a/a/a/h0/m;->b(Lc/a/a/a/h0/m;)Lc/a/a/a/h0/c;

    move-result-object v2

    iget-object v2, v2, Lc/a/a/a/h0/c;->c:[I

    array-length v2, v2

    rem-int/2addr v0, v2

    invoke-static {p1, v0}, Lc/a/a/a/h0/m;->a(Lc/a/a/a/h0/m;I)I

    .line 3
    iget-object p1, p0, Lc/a/a/a/h0/m$a;->a:Lc/a/a/a/h0/m;

    invoke-static {p1, v1}, Lc/a/a/a/h0/m;->a(Lc/a/a/a/h0/m;Z)Z

    return-void
.end method
