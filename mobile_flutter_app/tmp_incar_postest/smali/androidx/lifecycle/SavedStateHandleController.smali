.class public final Landroidx/lifecycle/SavedStateHandleController;
.super Ljava/lang/Object;
.source "SavedStateHandleController.java"

# interfaces
.implements Lb/n/f;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/lifecycle/SavedStateHandleController$a;
    }
.end annotation


# instance fields
.field public a:Z

.field public final b:Lb/n/p;


# direct methods
.method public static a(Lb/n/q;Landroidx/savedstate/SavedStateRegistry;Lb/n/e;)V
    .registers 4

    const-string v0, "androidx.lifecycle.savedstate.vm.tag"

    .line 10
    invoke-virtual {p0, v0}, Lb/n/q;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/lifecycle/SavedStateHandleController;

    if-eqz p0, :cond_16

    .line 11
    invoke-virtual {p0}, Landroidx/lifecycle/SavedStateHandleController;->a()Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_16

    .line 12
    :cond_11
    invoke-virtual {p0, p1, p2}, Landroidx/lifecycle/SavedStateHandleController;->a(Landroidx/savedstate/SavedStateRegistry;Lb/n/e;)V

    const/4 p0, 0x0

    throw p0

    :cond_16
    :goto_16
    return-void
.end method


# virtual methods
.method public a(Landroidx/savedstate/SavedStateRegistry;Lb/n/e;)V
    .registers 3

    .line 2
    iget-boolean p1, p0, Landroidx/lifecycle/SavedStateHandleController;->a:Z

    if-eqz p1, :cond_c

    .line 3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Already attached to lifecycleOwner"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_c
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Landroidx/lifecycle/SavedStateHandleController;->a:Z

    .line 5
    invoke-virtual {p2, p0}, Lb/n/e;->a(Lb/n/g;)V

    .line 6
    iget-object p1, p0, Landroidx/lifecycle/SavedStateHandleController;->b:Lb/n/p;

    invoke-virtual {p1}, Lb/n/p;->a()Landroidx/savedstate/SavedStateRegistry$b;

    const/4 p1, 0x0

    throw p1
.end method

.method public a(Lb/n/h;Lb/n/e$b;)V
    .registers 4

    .line 7
    sget-object v0, Lb/n/e$b;->ON_DESTROY:Lb/n/e$b;

    if-ne p2, v0, :cond_e

    const/4 p2, 0x0

    .line 8
    iput-boolean p2, p0, Landroidx/lifecycle/SavedStateHandleController;->a:Z

    .line 9
    invoke-interface {p1}, Lb/n/h;->a()Lb/n/e;

    move-result-object p1

    invoke-virtual {p1, p0}, Lb/n/e;->b(Lb/n/g;)V

    :cond_e
    return-void
.end method

.method public a()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/lifecycle/SavedStateHandleController;->a:Z

    return v0
.end method
