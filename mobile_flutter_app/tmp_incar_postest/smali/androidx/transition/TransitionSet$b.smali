.class public Landroidx/transition/TransitionSet$b;
.super Lb/s/u;
.source "TransitionSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/transition/TransitionSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Landroidx/transition/TransitionSet;


# direct methods
.method public constructor <init>(Landroidx/transition/TransitionSet;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Lb/s/u;-><init>()V

    .line 2
    iput-object p1, p0, Landroidx/transition/TransitionSet$b;->a:Landroidx/transition/TransitionSet;

    return-void
.end method


# virtual methods
.method public c(Landroidx/transition/Transition;)V
    .registers 3

    .line 1
    iget-object p1, p0, Landroidx/transition/TransitionSet$b;->a:Landroidx/transition/TransitionSet;

    iget-boolean v0, p1, Landroidx/transition/TransitionSet;->T:Z

    if-nez v0, :cond_e

    .line 2
    invoke-virtual {p1}, Landroidx/transition/Transition;->q()V

    .line 3
    iget-object p1, p0, Landroidx/transition/TransitionSet$b;->a:Landroidx/transition/TransitionSet;

    const/4 v0, 0x1

    iput-boolean v0, p1, Landroidx/transition/TransitionSet;->T:Z

    :cond_e
    return-void
.end method

.method public e(Landroidx/transition/Transition;)V
    .registers 4

    .line 1
    iget-object v0, p0, Landroidx/transition/TransitionSet$b;->a:Landroidx/transition/TransitionSet;

    iget v1, v0, Landroidx/transition/TransitionSet;->S:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Landroidx/transition/TransitionSet;->S:I

    if-nez v1, :cond_10

    const/4 v1, 0x0

    .line 2
    iput-boolean v1, v0, Landroidx/transition/TransitionSet;->T:Z

    .line 3
    invoke-virtual {v0}, Landroidx/transition/Transition;->b()V

    .line 4
    :cond_10
    invoke-virtual {p1, p0}, Landroidx/transition/Transition;->b(Landroidx/transition/Transition$f;)Landroidx/transition/Transition;

    return-void
.end method
