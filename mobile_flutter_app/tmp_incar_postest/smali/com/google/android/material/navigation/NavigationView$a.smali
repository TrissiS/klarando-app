.class public Lcom/google/android/material/navigation/NavigationView$a;
.super Ljava/lang/Object;
.source "NavigationView.java"

# interfaces
.implements Lb/b/p/j/g$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/navigation/NavigationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lcom/google/android/material/navigation/NavigationView;


# direct methods
.method public constructor <init>(Lcom/google/android/material/navigation/NavigationView;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/material/navigation/NavigationView$a;->h:Lcom/google/android/material/navigation/NavigationView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lb/b/p/j/g;)V
    .registers 2

    return-void
.end method

.method public a(Lb/b/p/j/g;Landroid/view/MenuItem;)Z
    .registers 3

    .line 1
    iget-object p1, p0, Lcom/google/android/material/navigation/NavigationView$a;->h:Lcom/google/android/material/navigation/NavigationView;

    iget-object p1, p1, Lcom/google/android/material/navigation/NavigationView;->o:Lcom/google/android/material/navigation/NavigationView$c;

    if-eqz p1, :cond_e

    invoke-interface {p1, p2}, Lcom/google/android/material/navigation/NavigationView$c;->a(Landroid/view/MenuItem;)Z

    move-result p1

    if-eqz p1, :cond_e

    const/4 p1, 0x1

    goto :goto_f

    :cond_e
    const/4 p1, 0x0

    :goto_f
    return p1
.end method
