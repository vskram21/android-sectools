.class public final enum Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;
.super Ljava/lang/Enum;
.source "PackWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PackingPhase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

.field public static final enum BUILDING_BITMAPS:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

.field public static final enum COMPRESSING:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

.field public static final enum COUNTING:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

.field public static final enum FINDING_SOURCES:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

.field public static final enum GETTING_SIZES:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

.field public static final enum WRITING:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2427
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    const-string v1, "COUNTING"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->COUNTING:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    .line 2430
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    const-string v1, "GETTING_SIZES"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->GETTING_SIZES:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    .line 2433
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    const-string v1, "FINDING_SOURCES"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->FINDING_SOURCES:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    .line 2436
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    const-string v1, "COMPRESSING"

    invoke-direct {v0, v1, v6}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->COMPRESSING:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    .line 2439
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    const-string v1, "WRITING"

    invoke-direct {v0, v1, v7}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->WRITING:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    .line 2442
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    const-string v1, "BUILDING_BITMAPS"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->BUILDING_BITMAPS:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    .line 2425
    const/4 v0, 0x6

    new-array v0, v0, [Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    sget-object v1, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->COUNTING:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->GETTING_SIZES:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->FINDING_SOURCES:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    aput-object v1, v0, v5

    sget-object v1, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->COMPRESSING:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    aput-object v1, v0, v6

    sget-object v1, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->WRITING:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->BUILDING_BITMAPS:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    aput-object v2, v0, v1

    sput-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->$VALUES:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

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
    .line 2425
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;
    .locals 1
    .parameter "name"

    .prologue
    .line 2425
    const-class v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;
    .locals 1

    .prologue
    .line 2425
    sget-object v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->$VALUES:[Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/internal/storage/pack/PackWriter$PackingPhase;

    return-object v0
.end method
