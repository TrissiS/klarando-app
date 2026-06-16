.class public Lcom/google/android/material/tabs/TabLayout$b;
.super Ljava/lang/Object;
.source "TabLayout.java"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$h;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/tabs/TabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Lcom/google/android/material/tabs/TabLayout;


# direct methods
.method public constructor <init>(Lcom/google/android/material/tabs/TabLayout;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout$b;->b:Lcom/google/android/material/tabs/TabLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroidx/viewpager/widget/ViewPager;Lb/v/a/a;Lb/v/a/a;)V
    .registers 5

    .line 1
    iget-object p2, p0, Lcom/google/android/material/tabs/TabLayout$b;->b:Lcom/google/android/material/tabs/TabLayout;

    iget-object v0, p2, Lcom/google/android/material/tabs/TabLayout;->Q:Landroidx/viewpager/widget/ViewPager;

    if-ne v0, p1, :cond_b

    .line 2
    iget-boolean p1, p0, Lcom/google/android/material/tabs/TabLayout$b;->a:Z

    invoke-virtual {p2, p3, p1}, Lcom/google/android/material/tabs/TabLayout;->a(Lb/v/a/a;Z)V

    :cond_b
    return-void
.end method

.method public a(Z)V
    .registers 2

    .line 3
    iput-boolean p1, p0, Lcom/google/android/material/tabs/TabLayout$b;->a:Z

    return-void
.end method
