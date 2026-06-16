.class public Lcom/google/android/material/navigation/NavigationBarPresenter;
.super Ljava/lang/Object;
.source "NavigationBarPresenter.java"

# interfaces
.implements Lb/b/p/j/m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/navigation/NavigationBarPresenter$SavedState;
    }
.end annotation


# instance fields
.field public h:Lb/b/p/j/g;

.field public i:Lc/a/a/a/f0/c;

.field public j:Z

.field public k:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/google/android/material/navigation/NavigationBarPresenter;->j:Z

    return-void
.end method


# virtual methods
.method public a()I
    .registers 2

    .line 8
    iget v0, p0, Lcom/google/android/material/navigation/NavigationBarPresenter;->k:I

    return v0
.end method

.method public a(I)V
    .registers 2

    .line 7
    iput p1, p0, Lcom/google/android/material/navigation/NavigationBarPresenter;->k:I

    return-void
.end method

.method public a(Landroid/content/Context;Lb/b/p/j/g;)V
    .registers 3

    .line 2
    iput-object p2, p0, Lcom/google/android/material/navigation/NavigationBarPresenter;->h:Lb/b/p/j/g;

    .line 3
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationBarPresenter;->i:Lc/a/a/a/f0/c;

    invoke-virtual {p1, p2}, Lc/a/a/a/f0/c;->a(Lb/b/p/j/g;)V

    return-void
.end method

.method public a(Landroid/os/Parcelable;)V
    .registers 4

    .line 9
    instance-of v0, p1, Lcom/google/android/material/navigation/NavigationBarPresenter$SavedState;

    if-eqz v0, :cond_1e

    .line 10
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarPresenter;->i:Lc/a/a/a/f0/c;

    check-cast p1, Lcom/google/android/material/navigation/NavigationBarPresenter$SavedState;

    iget v1, p1, Lcom/google/android/material/navigation/NavigationBarPresenter$SavedState;->h:I

    invoke-virtual {v0, v1}, Lc/a/a/a/f0/c;->c(I)V

    .line 11
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarPresenter;->i:Lc/a/a/a/f0/c;

    .line 12
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p1, p1, Lcom/google/android/material/navigation/NavigationBarPresenter$SavedState;->i:Lcom/google/android/material/internal/ParcelableSparseArray;

    .line 13
    invoke-static {v0, p1}, Lc/a/a/a/o/a;->a(Landroid/content/Context;Lcom/google/android/material/internal/ParcelableSparseArray;)Landroid/util/SparseArray;

    move-result-object p1

    .line 14
    iget-object v0, p0, Lcom/google/android/material/navigation/NavigationBarPresenter;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v0, p1}, Lc/a/a/a/f0/c;->setBadgeDrawables(Landroid/util/SparseArray;)V

    :cond_1e
    return-void
.end method

.method public a(Lb/b/p/j/g;Z)V
    .registers 3

    return-void
.end method

.method public a(Lb/b/p/j/m$a;)V
    .registers 2

    return-void
.end method

.method public a(Lc/a/a/a/f0/c;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/material/navigation/NavigationBarPresenter;->i:Lc/a/a/a/f0/c;

    return-void
.end method

.method public a(Z)V
    .registers 3

    .line 4
    iget-boolean v0, p0, Lcom/google/android/material/navigation/NavigationBarPresenter;->j:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    if-eqz p1, :cond_d

    .line 5
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationBarPresenter;->i:Lc/a/a/a/f0/c;

    invoke-virtual {p1}, Lc/a/a/a/f0/c;->a()V

    goto :goto_12

    .line 6
    :cond_d
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationBarPresenter;->i:Lc/a/a/a/f0/c;

    invoke-virtual {p1}, Lc/a/a/a/f0/c;->c()V

    :goto_12
    return-void
.end method

.method public a(Lb/b/p/j/g;Lb/b/p/j/i;)Z
    .registers 3

    const/4 p1, 0x0

    return p1
.end method

.method public a(Lb/b/p/j/r;)Z
    .registers 2

    const/4 p1, 0x0

    return p1
.end method

.method public b(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lcom/google/android/material/navigation/NavigationBarPresenter;->j:Z

    return-void
.end method

.method public b(Lb/b/p/j/g;Lb/b/p/j/i;)Z
    .registers 3

    const/4 p1, 0x0

    return p1
.end method

.method public c()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public d()Landroid/os/Parcelable;
    .registers 3

    .line 1
    new-instance v0, Lcom/google/android/material/navigation/NavigationBarPresenter$SavedState;

    invoke-direct {v0}, Lcom/google/android/material/navigation/NavigationBarPresenter$SavedState;-><init>()V

    .line 2
    iget-object v1, p0, Lcom/google/android/material/navigation/NavigationBarPresenter;->i:Lc/a/a/a/f0/c;

    invoke-virtual {v1}, Lc/a/a/a/f0/c;->getSelectedItemId()I

    move-result v1

    iput v1, v0, Lcom/google/android/material/navigation/NavigationBarPresenter$SavedState;->h:I

    .line 3
    iget-object v1, p0, Lcom/google/android/material/navigation/NavigationBarPresenter;->i:Lc/a/a/a/f0/c;

    .line 4
    invoke-virtual {v1}, Lc/a/a/a/f0/c;->getBadgeDrawables()Landroid/util/SparseArray;

    move-result-object v1

    invoke-static {v1}, Lc/a/a/a/o/a;->a(Landroid/util/SparseArray;)Lcom/google/android/material/internal/ParcelableSparseArray;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/material/navigation/NavigationBarPresenter$SavedState;->i:Lcom/google/android/material/internal/ParcelableSparseArray;

    return-object v0
.end method
