.class public Landroidx/lifecycle/SavedStateHandleController$1;
.super Ljava/lang/Object;
.source "SavedStateHandleController.java"

# interfaces
.implements Lb/n/f;


# instance fields
.field public final synthetic a:Lb/n/e;

.field public final synthetic b:Landroidx/savedstate/SavedStateRegistry;


# virtual methods
.method public a(Lb/n/h;Lb/n/e$b;)V
    .registers 3

    .line 1
    sget-object p1, Lb/n/e$b;->ON_START:Lb/n/e$b;

    if-ne p2, p1, :cond_10

    .line 2
    iget-object p1, p0, Landroidx/lifecycle/SavedStateHandleController$1;->a:Lb/n/e;

    invoke-virtual {p1, p0}, Lb/n/e;->b(Lb/n/g;)V

    .line 3
    iget-object p1, p0, Landroidx/lifecycle/SavedStateHandleController$1;->b:Landroidx/savedstate/SavedStateRegistry;

    const-class p2, Landroidx/lifecycle/SavedStateHandleController$a;

    invoke-virtual {p1, p2}, Landroidx/savedstate/SavedStateRegistry;->a(Ljava/lang/Class;)V

    :cond_10
    return-void
.end method
