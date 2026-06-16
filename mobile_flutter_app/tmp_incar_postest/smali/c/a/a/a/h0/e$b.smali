.class public Lc/a/a/a/h0/e$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CircularIndeterminateAnimatorDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/h0/e;->h()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/h0/e;


# direct methods
.method public constructor <init>(Lc/a/a/a/h0/e;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/h0/e$b;->a:Lc/a/a/a/h0/e;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/h0/e$b;->a:Lc/a/a/a/h0/e;

    invoke-virtual {p1}, Lc/a/a/a/h0/e;->a()V

    .line 3
    iget-object p1, p0, Lc/a/a/a/h0/e$b;->a:Lc/a/a/a/h0/e;

    iget-object v0, p1, Lc/a/a/a/h0/e;->k:Lb/t/a/a/b$a;

    iget-object p1, p1, Lc/a/a/a/h0/i;->a:Lc/a/a/a/h0/j;

    invoke-virtual {v0, p1}, Lb/t/a/a/b$a;->a(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
