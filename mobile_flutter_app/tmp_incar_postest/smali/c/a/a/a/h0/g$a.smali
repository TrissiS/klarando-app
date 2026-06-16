.class public Lc/a/a/a/h0/g$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DrawableWithAnimatedVisibilityChange.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/h0/g;->b(Landroid/animation/ValueAnimator;)V
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
    iput-object p1, p0, Lc/a/a/a/h0/g$a;->a:Lc/a/a/a/h0/g;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/h0/g$a;->a:Lc/a/a/a/h0/g;

    invoke-static {p1}, Lc/a/a/a/h0/g;->a(Lc/a/a/a/h0/g;)V

    return-void
.end method
