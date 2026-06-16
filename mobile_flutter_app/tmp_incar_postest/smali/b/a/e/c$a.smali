.class public Lb/a/e/c$a;
.super Lb/a/e/b;
.source "ActivityResultRegistry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/a/e/c;->a(Ljava/lang/String;Lb/a/e/e/a;Lb/a/e/a;)Lb/a/e/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lb/a/e/b<",
        "TI;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lb/a/e/c;


# direct methods
.method public constructor <init>(Lb/a/e/c;Ljava/lang/String;ILb/a/e/e/a;)V
    .registers 5

    .line 1
    iput-object p1, p0, Lb/a/e/c$a;->b:Lb/a/e/c;

    iput-object p2, p0, Lb/a/e/c$a;->a:Ljava/lang/String;

    invoke-direct {p0}, Lb/a/e/b;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/a/e/c$a;->b:Lb/a/e/c;

    iget-object v1, p0, Lb/a/e/c$a;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lb/a/e/c;->b(Ljava/lang/String;)V

    return-void
.end method
