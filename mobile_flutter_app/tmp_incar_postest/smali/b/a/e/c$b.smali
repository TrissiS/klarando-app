.class public Lb/a/e/c$b;
.super Ljava/lang/Object;
.source "ActivityResultRegistry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/a/e/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<O:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final a:Lb/a/e/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/a/e/a<",
            "TO;>;"
        }
    .end annotation
.end field

.field public final b:Lb/a/e/e/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/a/e/e/a<",
            "*TO;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lb/a/e/a;Lb/a/e/e/a;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/a/e/a<",
            "TO;>;",
            "Lb/a/e/e/a<",
            "*TO;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lb/a/e/c$b;->a:Lb/a/e/a;

    .line 3
    iput-object p2, p0, Lb/a/e/c$b;->b:Lb/a/e/e/a;

    return-void
.end method
