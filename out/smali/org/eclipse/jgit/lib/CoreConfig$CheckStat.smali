.class public final enum Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;
.super Ljava/lang/Enum;
.source "CoreConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/CoreConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CheckStat"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

.field public static final enum DEFAULT:Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

.field public static final enum MINIMAL:Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 87
    new-instance v0, Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    const-string v1, "MINIMAL"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;->MINIMAL:Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    .line 93
    new-instance v0, Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    const-string v1, "DEFAULT"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;->DEFAULT:Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    .line 82
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    sget-object v1, Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;->MINIMAL:Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;->DEFAULT:Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    aput-object v1, v0, v3

    sput-object v0, Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;->$VALUES:[Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 82
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;
    .locals 1
    .parameter "name"

    .prologue
    .line 82
    const-class v0, Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;
    .locals 1

    .prologue
    .line 82
    sget-object v0, Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;->$VALUES:[Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    return-object v0
.end method
