.class public Lc/a/a/a/p0/a$f;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ClearTextEndIconDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/p0/a;->d()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/p0/a;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/a;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/a$f;->a:Lc/a/a/a/p0/a;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 3

    .line 1
    iget-object p1, p0, Lc/a/a/a/p0/a$f;->a:Lc/a/a/a/p0/a;

    iget-object p1, p1, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconVisible(Z)V

    return-void
.end method
