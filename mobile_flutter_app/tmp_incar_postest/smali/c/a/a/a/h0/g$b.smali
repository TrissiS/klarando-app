.class public Lc/a/a/a/h0/g$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DrawableWithAnimatedVisibilityChange.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/h0/g;->a(Landroid/animation/ValueAnimator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/h0/g;


# direct methods
.method public constructor <init>(Lc/a/a/a/h0/g;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/h0/g$b;->a:Lc/a/a/a/h0/g;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/h0/g$b;->a:Lc/a/a/a/h0/g;

    const/4 v0, 0x0

    invoke-static {p1, v0, v0}, Lc/a/a/a/h0/g;->a(Lc/a/a/a/h0/g;ZZ)Z

    .line 3
    iget-object p1, p0, Lc/a/a/a/h0/g$b;->a:Lc/a/a/a/h0/g;

    invoke-static {p1}, Lc/a/a/a/h0/g;->b(Lc/a/a/a/h0/g;)V

    return-void
.end method
