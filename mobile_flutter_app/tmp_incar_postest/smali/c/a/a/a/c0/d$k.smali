.class public Lc/a/a/a/c0/d$k;
.super Lc/a/a/a/c0/d$l;
.source "FloatingActionButtonImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/c0/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "k"
.end annotation


# instance fields
.field public final synthetic e:Lc/a/a/a/c0/d;


# direct methods
.method public constructor <init>(Lc/a/a/a/c0/d;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lc/a/a/a/c0/d$k;->e:Lc/a/a/a/c0/d;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lc/a/a/a/c0/d$l;-><init>(Lc/a/a/a/c0/d;Lc/a/a/a/c0/d$a;)V

    return-void
.end method


# virtual methods
.method public a()F
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d$k;->e:Lc/a/a/a/c0/d;

    iget v0, v0, Lc/a/a/a/c0/d;->h:F

    return v0
.end method
