.class public Lc/a/a/a/d0/f$g;
.super Ljava/lang/Object;
.source "NavigationMenuPresenter.java"

# interfaces
.implements Lc/a/a/a/d0/f$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/d0/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "g"
.end annotation


# instance fields
.field public final a:Lb/b/p/j/i;

.field public b:Z


# direct methods
.method public constructor <init>(Lb/b/p/j/i;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lc/a/a/a/d0/f$g;->a:Lb/b/p/j/i;

    return-void
.end method


# virtual methods
.method public a()Lb/b/p/j/i;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/f$g;->a:Lb/b/p/j/i;

    return-object v0
.end method
