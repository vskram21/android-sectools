.class public final enum Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;
.super Ljava/lang/Enum;
.source "WorkingTreeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MetadataDiff"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

.field public static final enum DIFFER_BY_METADATA:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

.field public static final enum DIFFER_BY_TIMESTAMP:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

.field public static final enum EQUAL:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

.field public static final enum SMUDGED:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 692
    new-instance v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    const-string v1, "EQUAL"

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->EQUAL:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    .line 698
    new-instance v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    const-string v1, "DIFFER_BY_METADATA"

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->DIFFER_BY_METADATA:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    .line 701
    new-instance v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    const-string v1, "SMUDGED"

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->SMUDGED:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    .line 707
    new-instance v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    const-string v1, "DIFFER_BY_TIMESTAMP"

    invoke-direct {v0, v1, v5}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->DIFFER_BY_TIMESTAMP:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    .line 686
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    sget-object v1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->EQUAL:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    aput-object v1, v0, v2

    sget-object v1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->DIFFER_BY_METADATA:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    aput-object v1, v0, v3

    sget-object v1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->SMUDGED:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    aput-object v1, v0, v4

    sget-object v1, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->DIFFER_BY_TIMESTAMP:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    aput-object v1, v0, v5

    sput-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->$VALUES:[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

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
    .line 686
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;
    .locals 1
    .parameter "name"

    .prologue
    .line 686
    const-class v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    return-object v0
.end method

.method public static values()[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;
    .locals 1

    .prologue
    .line 686
    sget-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->$VALUES:[Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    invoke-virtual {v0}, [Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/eclipse/jgit/treewalk/WorkingTreeIterator$MetadataDiff;

    return-object v0
.end method
