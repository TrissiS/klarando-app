.class public Lc/a/a/a/c0/d$h;
.super Lc/a/a/a/c0/d$l;
.source "FloatingActionButtonImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/c0/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "h"
.end annotation


# instance fields
.field public final synthetic e:Lc/a/a/a/c0/d;


# direct methods
.method public constructor <init>(Lc/a/a/a/c0/d;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lc/a/a/a/c0/d$h;->e:Lc/a/a/a/c0/d;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lc/a/a/a/c0/d$l;-><init>(Lc/a/a/a/c0/d;Lc/a/a/a/c0/d$a;)V

    return-void
.end method


# virtual methods
.method public a()F
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d$h;->e:Lc/a/a/a/c0/d;

    iget v1, v0, Lc/a/a/a/c0/d;->h:F

    iget v0, v0, Lc/a/a/a/c0/d;->j:F

    add-float/2addr v1, v0

    return v1
.end method
