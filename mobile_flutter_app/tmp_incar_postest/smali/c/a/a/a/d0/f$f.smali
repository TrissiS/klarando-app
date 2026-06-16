.class public Lc/a/a/a/d0/f$f;
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
    name = "f"
.end annotation


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method public constructor <init>(II)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput p1, p0, Lc/a/a/a/d0/f$f;->a:I

    .line 3
    iput p2, p0, Lc/a/a/a/d0/f$f;->b:I

    return-void
.end method


# virtual methods
.method public a()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/d0/f$f;->b:I

    return v0
.end method

.method public b()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/d0/f$f;->a:I

    return v0
.end method
