.class public Lcom/google/android/material/bottomsheet/BottomSheetBehavior$d;
.super Ljava/lang/Object;
.source "BottomSheetBehavior.java"

# interfaces
.implements Lc/a/a/a/d0/t$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;


# direct methods
.method public constructor <init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;Z)V
    .registers 3

    .line 1
    iput-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$d;->b:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iput-boolean p2, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$d;->a:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Lb/h/m/g0;Lc/a/a/a/d0/t$f;)Lb/h/m/g0;
    .registers 9

    .line 1
    iget-object v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$d;->b:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    invoke-virtual {p2}, Lb/h/m/g0;->h()I

    move-result v1

    invoke-static {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;I)I

    .line 2
    invoke-static {p1}, Lc/a/a/a/d0/t;->e(Landroid/view/View;)Z

    move-result v0

    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    .line 6
    iget-object v4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$d;->b:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    invoke-static {v4}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->e(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)Z

    move-result v4

    if-eqz v4, :cond_33

    .line 7
    iget-object v1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$d;->b:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    invoke-virtual {p2}, Lb/h/m/g0;->e()I

    move-result v4

    invoke-static {v1, v4}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->b(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;I)I

    .line 8
    iget v1, p3, Lc/a/a/a/d0/t$f;->d:I

    iget-object v4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$d;->b:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    invoke-static {v4}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->f(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)I

    move-result v4

    add-int/2addr v1, v4

    .line 9
    :cond_33
    iget-object v4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$d;->b:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    invoke-static {v4}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->g(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)Z

    move-result v4

    if-eqz v4, :cond_47

    if-eqz v0, :cond_40

    .line 10
    iget v2, p3, Lc/a/a/a/d0/t$f;->c:I

    goto :goto_42

    :cond_40
    iget v2, p3, Lc/a/a/a/d0/t$f;->a:I

    .line 11
    :goto_42
    invoke-virtual {p2}, Lb/h/m/g0;->f()I

    move-result v4

    add-int/2addr v2, v4

    .line 12
    :cond_47
    iget-object v4, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$d;->b:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    invoke-static {v4}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->h(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)Z

    move-result v4

    if-eqz v4, :cond_5c

    if-eqz v0, :cond_54

    .line 13
    iget p3, p3, Lc/a/a/a/d0/t$f;->a:I

    goto :goto_56

    :cond_54
    iget p3, p3, Lc/a/a/a/d0/t$f;->c:I

    .line 14
    :goto_56
    invoke-virtual {p2}, Lb/h/m/g0;->g()I

    move-result v0

    add-int v3, p3, v0

    .line 15
    :cond_5c
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result p3

    invoke-virtual {p1, v2, p3, v3, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 16
    iget-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$d;->a:Z

    if-eqz p1, :cond_72

    .line 17
    iget-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$d;->b:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    invoke-virtual {p2}, Lb/h/m/g0;->d()Lb/h/f/b;

    move-result-object p3

    iget p3, p3, Lb/h/f/b;->d:I

    invoke-static {p1, p3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->c(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;I)I

    .line 18
    :cond_72
    iget-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$d;->b:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    invoke-static {p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->e(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)Z

    move-result p1

    if-nez p1, :cond_7e

    iget-boolean p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$d;->a:Z

    if-eqz p1, :cond_84

    .line 19
    :cond_7e
    iget-object p1, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$d;->b:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    const/4 p3, 0x0

    invoke-static {p1, p3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->a(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;Z)V

    :cond_84
    return-object p2
.end method
