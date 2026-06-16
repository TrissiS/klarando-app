.class public Lcom/google/android/material/internal/NavigationMenuItemView$a;
.super Lb/h/m/a;
.source "NavigationMenuItemView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/internal/NavigationMenuItemView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic d:Lcom/google/android/material/internal/NavigationMenuItemView;


# direct methods
.method public constructor <init>(Lcom/google/android/material/internal/NavigationMenuItemView;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/material/internal/NavigationMenuItemView$a;->d:Lcom/google/android/material/internal/NavigationMenuItemView;

    invoke-direct {p0}, Lb/h/m/a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Lb/h/m/h0/c;)V
    .registers 3

    .line 1
    invoke-super {p0, p1, p2}, Lb/h/m/a;->a(Landroid/view/View;Lb/h/m/h0/c;)V

    .line 2
    iget-object p1, p0, Lcom/google/android/material/internal/NavigationMenuItemView$a;->d:Lcom/google/android/material/internal/NavigationMenuItemView;

    iget-boolean p1, p1, Lcom/google/android/material/internal/NavigationMenuItemView;->E:Z

    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->c(Z)V

    return-void
.end method
