.class public final Lb/h/e/c/c$b;
.super Ljava/lang/Object;
.source "FontResourcesParserCompat.java"

# interfaces
.implements Lb/h/e/c/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/e/c/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:[Lb/h/e/c/c$c;


# direct methods
.method public constructor <init>([Lb/h/e/c/c$c;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lb/h/e/c/c$b;->a:[Lb/h/e/c/c$c;

    return-void
.end method


# virtual methods
.method public a()[Lb/h/e/c/c$c;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/h/e/c/c$b;->a:[Lb/h/e/c/c$c;

    return-object v0
.end method
