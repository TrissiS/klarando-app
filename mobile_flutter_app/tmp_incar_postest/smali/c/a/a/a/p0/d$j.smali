.class public Lc/a/a/a/p0/d$j;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DropdownMenuEndIconDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/p0/d;->c()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/p0/d;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/d;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/d$j;->a:Lc/a/a/a/p0/d;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lc/a/a/a/p0/d$j;->a:Lc/a/a/a/p0/d;

    iget-object v0, p1, Lc/a/a/a/p0/e;->c:Lcom/google/android/material/internal/CheckableImageButton;

    invoke-static {p1}, Lc/a/a/a/p0/d;->e(Lc/a/a/a/p0/d;)Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/material/internal/CheckableImageButton;->setChecked(Z)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/p0/d$j;->a:Lc/a/a/a/p0/d;

    invoke-static {p1}, Lc/a/a/a/p0/d;->f(Lc/a/a/a/p0/d;)Landroid/animation/ValueAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method
