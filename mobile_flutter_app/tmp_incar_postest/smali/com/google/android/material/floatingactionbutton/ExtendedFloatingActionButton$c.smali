.class public Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ExtendedFloatingActionButton.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->a(Lc/a/a/a/c0/f;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Lc/a/a/a/c0/f;

.field public final synthetic c:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;


# direct methods
.method public constructor <init>(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;Lc/a/a/a/c0/f;Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;)V
    .registers 4

    .line 1
    iput-object p2, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$c;->b:Lc/a/a/a/c0/f;

    iput-object p3, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$c;->c:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .registers 2

    const/4 p1, 0x1

    .line 1
    iput-boolean p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$c;->a:Z

    .line 2
    iget-object p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$c;->b:Lc/a/a/a/c0/f;

    invoke-interface {p1}, Lc/a/a/a/c0/f;->d()V

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$c;->b:Lc/a/a/a/c0/f;

    invoke-interface {p1}, Lc/a/a/a/c0/f;->c()V

    .line 2
    iget-boolean p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$c;->a:Z

    if-nez p1, :cond_10

    .line 3
    iget-object p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$c;->b:Lc/a/a/a/c0/f;

    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$c;->c:Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;

    invoke-interface {p1, v0}, Lc/a/a/a/c0/f;->a(Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$j;)V

    :cond_10
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$c;->b:Lc/a/a/a/c0/f;

    invoke-interface {v0, p1}, Lc/a/a/a/c0/f;->onAnimationStart(Landroid/animation/Animator;)V

    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton$c;->a:Z

    return-void
.end method
