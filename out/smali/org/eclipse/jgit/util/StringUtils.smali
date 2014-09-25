.class public final Lorg/eclipse/jgit/util/StringUtils;
.super Ljava/lang/Object;
.source "StringUtils.java"


# static fields
.field private static final LC:[C


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 56
    const/16 v1, 0x5b

    new-array v1, v1, [C

    sput-object v1, Lorg/eclipse/jgit/util/StringUtils;->LC:[C

    .line 57
    const/4 v0, 0x0

    .local v0, c:C
    :goto_0
    sget-object v1, Lorg/eclipse/jgit/util/StringUtils;->LC:[C

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 58
    sget-object v1, Lorg/eclipse/jgit/util/StringUtils;->LC:[C

    aput-char v0, v1, v0

    .line 57
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_0

    .line 59
    :cond_0
    const/16 v0, 0x41

    :goto_1
    const/16 v1, 0x5a

    if-gt v0, v1, :cond_1

    .line 60
    sget-object v1, Lorg/eclipse/jgit/util/StringUtils;->LC:[C

    add-int/lit8 v2, v0, -0x41

    add-int/lit8 v2, v2, 0x61

    int-to-char v2, v2

    aput-char v2, v1, v0

    .line 59
    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_1

    .line 61
    :cond_1
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 268
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 270
    return-void
.end method

.method public static compareIgnoreCase(Ljava/lang/String;Ljava/lang/String;)I
    .locals 4
    .parameter "a"
    .parameter "b"

    .prologue
    .line 138
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 139
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lorg/eclipse/jgit/util/StringUtils;->toLowerCase(C)C

    move-result v2

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lorg/eclipse/jgit/util/StringUtils;->toLowerCase(C)C

    move-result v3

    sub-int v0, v2, v3

    .line 140
    .local v0, d:I
    if-eqz v0, :cond_0

    .line 143
    .end local v0           #d:I
    :goto_1
    return v0

    .line 138
    .restart local v0       #d:I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 143
    .end local v0           #d:I
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int v0, v2, v3

    goto :goto_1
.end method

.method public static compareWithCase(Ljava/lang/String;Ljava/lang/String;)I
    .locals 4
    .parameter "a"
    .parameter "b"

    .prologue
    .line 161
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 162
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sub-int v0, v2, v3

    .line 163
    .local v0, d:I
    if-eqz v0, :cond_0

    .line 166
    .end local v0           #d:I
    :goto_1
    return v0

    .line 161
    .restart local v0       #d:I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 166
    .end local v0           #d:I
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int v0, v2, v3

    goto :goto_1
.end method

.method public static equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .parameter "a"
    .parameter "b"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 112
    if-ne p0, p1, :cond_1

    .line 120
    :cond_0
    :goto_0
    return v1

    .line 114
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-eq v3, v4, :cond_2

    move v1, v2

    .line 115
    goto :goto_0

    .line 116
    :cond_2
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 117
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lorg/eclipse/jgit/util/StringUtils;->toLowerCase(C)C

    move-result v3

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lorg/eclipse/jgit/util/StringUtils;->toLowerCase(C)C

    move-result v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 118
    goto :goto_0

    .line 116
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static isEmptyOrNull(Ljava/lang/String;)Z
    .locals 1
    .parameter "stringValue"

    .prologue
    .line 280
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter "separator"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 235
    .local p0, parts:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-static {p0, p1, p1}, Lorg/eclipse/jgit/util/StringUtils;->join(Ljava/util/Collection;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static join(Ljava/util/Collection;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter
    .parameter "separator"
    .parameter "lastSeparator"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 253
    .local p0, parts:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 254
    .local v4, sb:Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .line 255
    .local v0, i:I
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v5

    add-int/lit8 v2, v5, -0x1

    .line 256
    .local v2, lastIndex:I
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 257
    .local v3, part:Ljava/lang/String;
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    add-int/lit8 v5, v2, -0x1

    if-ne v0, v5, :cond_1

    .line 259
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 264
    goto :goto_0

    .line 260
    :cond_1
    if-eq v0, v2, :cond_0

    .line 261
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 265
    .end local v3           #part:Ljava/lang/String;
    :cond_2
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static replaceLineBreaksWithSpace(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .parameter "in"

    .prologue
    const/16 v8, 0xa

    const/16 v7, 0x20

    .line 292
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    new-array v0, v5, [C

    .line 293
    .local v0, buf:[C
    const/4 v3, 0x0

    .line 294
    .local v3, o:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v5, v0

    if-ge v2, v5, :cond_3

    .line 295
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 296
    .local v1, ch:C
    const/16 v5, 0xd

    if-ne v1, v5, :cond_1

    .line 297
    add-int/lit8 v5, v2, 0x1

    array-length v6, v0

    if-ge v5, v6, :cond_0

    add-int/lit8 v5, v2, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v8, :cond_0

    .line 298
    add-int/lit8 v4, v3, 0x1

    .end local v3           #o:I
    .local v4, o:I
    aput-char v7, v0, v3

    .line 299
    add-int/lit8 v2, v2, 0x1

    move v3, v4

    .line 294
    .end local v4           #o:I
    .restart local v3       #o:I
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 301
    :cond_0
    add-int/lit8 v4, v3, 0x1

    .end local v3           #o:I
    .restart local v4       #o:I
    aput-char v7, v0, v3

    move v3, v4

    .end local v4           #o:I
    .restart local v3       #o:I
    goto :goto_1

    .line 302
    :cond_1
    if-ne v1, v8, :cond_2

    .line 303
    add-int/lit8 v4, v3, 0x1

    .end local v3           #o:I
    .restart local v4       #o:I
    aput-char v7, v0, v3

    move v3, v4

    .end local v4           #o:I
    .restart local v3       #o:I
    goto :goto_1

    .line 305
    :cond_2
    add-int/lit8 v4, v3, 0x1

    .end local v3           #o:I
    .restart local v4       #o:I
    aput-char v1, v0, v3

    move v3, v4

    .end local v4           #o:I
    .restart local v3       #o:I
    goto :goto_1

    .line 307
    .end local v1           #ch:C
    :cond_3
    new-instance v5, Ljava/lang/String;

    const/4 v6, 0x0

    invoke-direct {v5, v0, v6, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v5
.end method

.method public static toBoolean(Ljava/lang/String;)Z
    .locals 5
    .parameter "stringValue"

    .prologue
    .line 181
    if-nez p0, :cond_0

    .line 182
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->expectedBooleanStringValue:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 184
    :cond_0
    invoke-static {p0}, Lorg/eclipse/jgit/util/StringUtils;->toBooleanOrNull(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 185
    .local v0, bool:Ljava/lang/Boolean;
    if-nez v0, :cond_1

    .line 186
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->notABoolean:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 188
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1
.end method

.method public static toBooleanOrNull(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2
    .parameter "stringValue"

    .prologue
    const/4 v0, 0x0

    .line 208
    if-nez p0, :cond_1

    .line 222
    :cond_0
    :goto_0
    return-object v0

    .line 211
    :cond_1
    const-string v1, "yes"

    invoke-static {v1, p0}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "true"

    invoke-static {v1, p0}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "1"

    invoke-static {v1, p0}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "on"

    invoke-static {v1, p0}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 215
    :cond_2
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    .line 216
    :cond_3
    const-string v1, "no"

    invoke-static {v1, p0}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "false"

    invoke-static {v1, p0}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "0"

    invoke-static {v1, p0}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "off"

    invoke-static {v1, p0}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 220
    :cond_4
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public static toLowerCase(C)C
    .locals 1
    .parameter "c"

    .prologue
    .line 76
    const/16 v0, 0x5a

    if-gt p0, v0, :cond_0

    sget-object v0, Lorg/eclipse/jgit/util/StringUtils;->LC:[C

    aget-char p0, v0, p0

    .end local p0
    :cond_0
    return p0
.end method

.method public static toLowerCase(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "in"

    .prologue
    .line 93
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 94
    .local v1, r:Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 95
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lorg/eclipse/jgit/util/StringUtils;->toLowerCase(C)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 94
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 96
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
