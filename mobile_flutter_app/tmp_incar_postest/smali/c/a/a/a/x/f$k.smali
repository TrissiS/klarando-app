.class public final enum Lc/a/a/a/x/f$k;
.super Ljava/lang/Enum;
.source "MaterialCalendar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/x/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "k"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lc/a/a/a/x/f$k;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum DAY:Lc/a/a/a/x/f$k;

.field public static final enum YEAR:Lc/a/a/a/x/f$k;

.field public static final synthetic h:[Lc/a/a/a/x/f$k;


# direct methods
.method public static constructor <clinit>()V
    .registers 5

    .line 1
    new-instance v0, Lc/a/a/a/x/f$k;

    const/4 v1, 0x0

    const-string v2, "DAY"

    invoke-direct {v0, v2, v1}, Lc/a/a/a/x/f$k;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/a/a/x/f$k;->DAY:Lc/a/a/a/x/f$k;

    .line 2
    new-instance v0, Lc/a/a/a/x/f$k;

    const/4 v2, 0x1

    const-string v3, "YEAR"

    invoke-direct {v0, v3, v2}, Lc/a/a/a/x/f$k;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lc/a/a/a/x/f$k;->YEAR:Lc/a/a/a/x/f$k;

    const/4 v3, 0x2

    new-array v3, v3, [Lc/a/a/a/x/f$k;

    .line 3
    sget-object v4, Lc/a/a/a/x/f$k;->DAY:Lc/a/a/a/x/f$k;

    aput-object v4, v3, v1

    aput-object v0, v3, v2

    sput-object v3, Lc/a/a/a/x/f$k;->h:[Lc/a/a/a/x/f$k;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lc/a/a/a/x/f$k;
    .registers 2

    .line 1
    const-class v0, Lc/a/a/a/x/f$k;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lc/a/a/a/x/f$k;

    return-object p0
.end method

.method public static values()[Lc/a/a/a/x/f$k;
    .registers 1

    .line 1
    sget-object v0, Lc/a/a/a/x/f$k;->h:[Lc/a/a/a/x/f$k;

    invoke-virtual {v0}, [Lc/a/a/a/x/f$k;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lc/a/a/a/x/f$k;

    return-object v0
.end method
