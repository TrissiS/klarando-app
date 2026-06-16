.class public Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;
.super Ljava/lang/Object;
.source "BottomSheetBehavior.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "h"
.end annotation


# instance fields
.field public final h:Landroid/view/View;

.field public i:Z

.field public j:I

.field public final synthetic k:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;


# direct methods
.method public constructor <init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;Landroid/view/View;I)V
    .registers 4

    .line 1
    iput-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;->k:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;->h:Landroid/view/View;

    .line 3
    iput p3, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;->j:I

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;->i:Z

    return p0
.end method

.method public static synthetic a(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;Z)Z
    .registers 2

    .line 2
    iput-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;->i:Z

    return p1
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;->k:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget-object v0, v0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->H:Lb/j/a/c;

    if-eqz v0, :cond_13

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lb/j/a/c;->a(Z)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 2
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;->h:Landroid/view/View;

    invoke-static {v0, p0}, Lb/h/m/y;->a(Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_1a

    .line 3
    :cond_13
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;->k:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;->j:I

    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->h(I)V

    :goto_1a
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$h;->i:Z

    return-void
.end method
