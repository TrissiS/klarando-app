.class public Ld/a/d/g/d$b;
.super Ljava/lang/Object;
.source "Overlay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ld/a/d/g/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ld/a/d/g/d$b$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:Ld/a/d/g/d$b$a;


# direct methods
.method public constructor <init>(IIILd/a/d/g/d$b$a;)V
    .registers 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Ld/a/d/g/d$b;->a:I

    .line 3
    iput p1, p0, Ld/a/d/g/d$b;->a:I

    .line 4
    iput p2, p0, Ld/a/d/g/d$b;->b:I

    .line 5
    iput p3, p0, Ld/a/d/g/d$b;->c:I

    .line 6
    iput-object p4, p0, Ld/a/d/g/d$b;->d:Ld/a/d/g/d$b$a;

    return-void
.end method
