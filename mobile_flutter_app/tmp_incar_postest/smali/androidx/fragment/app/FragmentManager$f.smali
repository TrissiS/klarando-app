.class public Landroidx/fragment/app/FragmentManager$f;
.super Ljava/lang/Object;
.source "FragmentManager.java"

# interfaces
.implements Lb/l/d/x;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/fragment/app/FragmentManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>(Landroidx/fragment/app/FragmentManager;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/ViewGroup;)Lb/l/d/w;
    .registers 3

    .line 1
    new-instance v0, Lb/l/d/b;

    invoke-direct {v0, p1}, Lb/l/d/b;-><init>(Landroid/view/ViewGroup;)V

    return-object v0
.end method
