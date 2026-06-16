.class public Lc/a/a/a/c0/d$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FloatingActionButtonImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/c0/d;->a(Lc/a/a/a/c0/d$j;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Z

.field public final synthetic c:Lc/a/a/a/c0/d$j;

.field public final synthetic d:Lc/a/a/a/c0/d;


# direct methods
.method public constructor <init>(Lc/a/a/a/c0/d;ZLc/a/a/a/c0/d$j;)V
    .registers 4

    .line 1
    iput-object p1, p0, Lc/a/a/a/c0/d$a;->d:Lc/a/a/a/c0/d;

    iput-boolean p2, p0, Lc/a/a/a/c0/d$a;->b:Z

    iput-object p3, p0, Lc/a/a/a/c0/d$a;->c:Lc/a/a/a/c0/d$j;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .registers 2

    const/4 p1, 0x1

    .line 1
    iput-boolean p1, p0, Lc/a/a/a/c0/d$a;->a:Z

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 4

    .line 1
    iget-object p1, p0, Lc/a/a/a/c0/d$a;->d:Lc/a/a/a/c0/d;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/c0/d;I)I

    .line 2
    iget-object p1, p0, Lc/a/a/a/c0/d$a;->d:Lc/a/a/a/c0/d;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/c0/d;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 3
    iget-boolean p1, p0, Lc/a/a/a/c0/d$a;->a:Z

    if-nez p1, :cond_28

    .line 4
    iget-object p1, p0, Lc/a/a/a/c0/d$a;->d:Lc/a/a/a/c0/d;

    iget-object p1, p1, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    iget-boolean v0, p0, Lc/a/a/a/c0/d$a;->b:Z

    if-eqz v0, :cond_1b

    const/16 v0, 0x8

    goto :goto_1c

    :cond_1b
    const/4 v0, 0x4

    :goto_1c
    iget-boolean v1, p0, Lc/a/a/a/c0/d$a;->b:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/android/material/internal/VisibilityAwareImageButton;->a(IZ)V

    .line 5
    iget-object p1, p0, Lc/a/a/a/c0/d$a;->c:Lc/a/a/a/c0/d$j;

    if-eqz p1, :cond_28

    .line 6
    invoke-interface {p1}, Lc/a/a/a/c0/d$j;->b()V

    :cond_28
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 5

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d$a;->d:Lc/a/a/a/c0/d;

    iget-object v0, v0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    iget-boolean v1, p0, Lc/a/a/a/c0/d$a;->b:Z

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/google/android/material/internal/VisibilityAwareImageButton;->a(IZ)V

    .line 2
    iget-object v0, p0, Lc/a/a/a/c0/d$a;->d:Lc/a/a/a/c0/d;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/c0/d;I)I

    .line 3
    iget-object v0, p0, Lc/a/a/a/c0/d$a;->d:Lc/a/a/a/c0/d;

    invoke-static {v0, p1}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/c0/d;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 4
    iput-boolean v2, p0, Lc/a/a/a/c0/d$a;->a:Z

    return-void
.end method
